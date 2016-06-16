class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

  def index
  end

  def meeting
    @meeting = Meeting.find(1)
    @meeting.status = params[:status] if params[:status]
    @meeting.save
    @acts = Act.all
    @amandments = Amandment.all
  end

end
