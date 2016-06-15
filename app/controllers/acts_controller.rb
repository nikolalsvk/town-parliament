class ActsController < ApplicationController
  before_action :set_act, only: [:show, :edit, :update, :destroy]

  # GET /acts
  def index
    @acts = Act.all
  end

  # GET /acts/1
  def show
    @akt = Act.find(params[:id])
    @client = Connection::MarkLogic.client
    @akt_xml = Transform::ToXml.transform(@akt)

    @client.send_corona_request("/v1/documents?database=Tim22&uri=/test/#{@akt.name}.xml", :put, @akt_xml.to_s)

    @act = @client.send_corona_request("/v1/documents?database=Tim22&uri=/test/#{@akt.name}.xml")
    @act  = Nokogiri::XML(@act)
  end

  # GET /acts/new
  def new
    @act ||= build_act
  end

  # GET /acts/1/edit
  def edit
  end

  # POST /acts
  def create
    @act = Act.new(act_params)

    if @act.save

      redirect_to @act, notice: 'Act was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /acts/1
  def update
    if @act.update(act_params)
      redirect_to @act, notice: 'Act was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /acts/1
  def destroy
    @akt = Act.find(params[:id])
    @client = Connection::MarkLogic.client
    @client.send_corona_request("/v1/documents?database=Tim22&uri=/test/#{@akt.name}.xml", :delete)
    @act.destroy
    redirect_to acts_url, notice: 'Act was successfully destroyed.'
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_act
    @act = Act.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def act_params
    params.require(:act).permit(:state, :name, :city, :date, :preambula)  
  end

  def to_s
    if @document
      @document.to_xml(:save_with => Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
    else
      super.to_s
    end
  end
  
  def build_act 
    session[:act] = Act.new
  end

  def current_act
    @act = session[:act]
  end

  def purge_act
    session[:act] = nil
  end
end
