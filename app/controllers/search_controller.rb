class SearchController < ApplicationController

  def index
  end

  def perform
    @result = Searchable.search(params[:search])

    render :index
  end

end
