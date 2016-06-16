class PagesController < ApplicationController

  def index
  end
  def meeting
    @meeting = Meeting.find(1)
    @meeting.status = @meeting.status ? false : true
    @meeting.save
    @acts = Act.all
    @amandments = Amandment.all
  end
end
