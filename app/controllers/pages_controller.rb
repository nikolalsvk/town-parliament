class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

  def index
  end

  def meeting
    unless params[:format].nil?
      @akt = Act.find(params[:format])
      @akt.status = "approved"
      @akt.save
      redirect_to @akt, notice: 'Act was successfully approved.'
    end
    
    @meeting = Meeting.find(1)
    @meeting.status = params[:status] if params[:status]
    @meeting.save
    @acts = Act.all
    @amandments = Amandment.all
  end

end
