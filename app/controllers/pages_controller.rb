class PagesController < ApplicationController

  def index
  end
  def meeting
    @meeting = Meeting.find(1)
    if @meeting.status==false
      @meeting.status=true
    else
      @meeting.status=false
    end
    @meeting.save
    @acts = Act.all
    @amandments = Amandment.all
  end
end
