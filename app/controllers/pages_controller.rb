class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

  def index
  end

  def meeting
    unless params[:akt].nil?
      @akt = Act.find(params[:akt])
      @akt.status = "approved"
      @akt.save
      redirect_to @akt, notice: 'Act was successfully approved.'
    end

    unless params[:amandman].nil?
      @amandman = Amandment.find(params[:amandman])

      @akt = Act.find(params[:akt_id])
      @akt_new = Act.find(@amandman.owner_id)

      @akt_xml = Transform::ToXml.transform(@akt_new)

      mark_logic = Connection::MarkLogic.new
      mark_logic.upload_act(@akt, @akt_xml.to_s)

      @amandman.status = "approved"
      @amandman.save

      redirect_to @akt, notice: 'Amandman was successfully approved.'
    end

    @meeting = Meeting.find(1)
    @meeting.status = params[:status] if params[:status]
    @meeting.save
    @acts = Act.all
    @amandments = Amandment.all
  end

  private

  def to_s
    if @document
      @document.to_xml(:save_with => Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
    else
      super.to_s
    end
  end
end
