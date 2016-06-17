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
      @amandman.status = "approved"
      @amandman.save
      redirect_to @amandman, notice: 'Amandman was successfully approved.'
    end

    @meeting = Meeting.find(1)
    @meeting.status = params[:status] if params[:status]
    @meeting.save
    @acts = Act.all
    @amandments = Amandment.all
  end

end
