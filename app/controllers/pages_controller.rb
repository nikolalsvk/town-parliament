class PagesController < ApplicationController

  def index
  end

  def acts
    @acts = Act.all
  end

  def show
    @akt = Act.find(params[:format])
    @client = Connection::MarkLogic.client
    @akt_xml = Transform::ToXml.transform(@akt)

    @client.send_corona_request("/v1/documents?database=Tim22&uri=/test/#{@akt.name}.xml", :put, @akt_xml.to_s)

    @act = @client.send_corona_request("/v1/documents?database=Tim22&uri=/test/"+@akt.name+".xml")
    @act  = Nokogiri::XML(@act)

  end

  def to_s
    if @document
      @document.to_xml(:save_with => Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
    else
      super.to_s
    end
  end

end
