class PagesController < ApplicationController

  def index
    @client = Connection::MarkLogic.client
  end

end
