class SearchController < ApplicationController

  def index
    @result = nil
  end

  def perform
    @result = Searchable.search(params[:search])

    render :index
  end

end
