class ActsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_act, only: [:show, :edit, :update, :destroy]

  # GET /acts
  def index
    if current_user.assembly_president?
      @acts = Act.all
    elsif current_user.alderman?
      @acts = Act.where(:user_id => current_user.id)
    else current_user.citizen?
      @acts = Act.where(:status => "approved")
    end
  end

  # GET /acts/1
  def show
    @akt = Act.find(params[:id])
    @aktlink = "http://147.91.177.194:8000/v1/documents?database=Tim22&uri=/test/#{@akt.name}.xml"
    @client = Connection::MarkLogic.client
    @act = @client.send_corona_request("/v1/documents?database=Tim22&uri=/test/#{@akt.name}.xml")
    @act  = Nokogiri::XML(@act)
  end

  # GET /acts/new
  def new
    @act = Act.new
    @meeting = Meeting.find(1)
    intit_heads
  end

  # GET /acts/1/edit
  def edit
    @amandment = Amandment.new
  end

  # POST /acts
  def create
    @act = Act.new(act_params)

    if @act.save
      session[:heads].each do |head_id|
        Head.find_by_id(head_id).update(act_id: @act.id)
      end
      redirect_to @act, notice: 'Act was successfully created.'
    else
      render :new
    end
  end

  # HEAD STUFF

  def create_head_intro
    if params[:head][:act_id]
      @head = Head.create(category: params[:head][:category], 
                        name: params[:head][:name],
                        act_id: params[:head][:act_id])
    
    else
    @head = Head.create(category: params[:head][:category], 
                        name: params[:head][:name])
    end
    add_head_id(@head.id)    
    respond_to do |format|
      format.js
    end
  end

  def destroy_head
    # destroy heds here
    @head = Head.find_by_id(params[:id]).destroy
    remove_head_id(@head.id)
    respond_to do |format|
      format.js
    end
  end

  # REGULATION STUFF

  def prepare_regulation
    @head = Head.find_by_id(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def create_regulation
    @regulation = Regulation.create(name: params[:regulation][:name],
                                    definition: params[:regulation][:definition],
                                    head_id: params[:regulation][:head_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy_regulation
    Regulation.find_by_id(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end

  # SUBJECT STUFF

  def prepare_subject
    @regulation = Regulation.find_by_id(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def create_subject
    @subject = Subject.create(name: params[:subject][:name],
                              regulation_id: params[:subject][:regulation_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy_subject
    Subject.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.js
    end
  end

  # CLAUSE STUFF

  def prepare_clause
    @subject = Subject.find_by_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create_clause
    @clause = Clause.create(name: params[:clause][:name],
                            subject_id: params[:clause][:subject_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy_clause
    Clause.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.js
    end
  end

  # STANCE STUFF

  def prepare_stance
    @clause = Clause.find_by_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create_stance
    @stance = Stance.create(name: params[:stance][:name],
                            content: params[:stance][:content],
                            clause_id: params[:stance][:clause_id])

    respond_to do |format|
      format.js
    end
  end

  def destroy_stance
    Stance.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.js
    end
  end

  # DOT STUFF

  def prepare_dot
    @stance = Stance.find_by_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create_dot
    @dot = Dot.create(name: params[:dot][:name],
                      content: params[:dot][:content],
                      stance_id: params[:dot][:stance_id])

    respond_to do |format|
      format.js
    end
  end

  def destroy_dot
    Dot.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.js
    end
  end

  # SUBDOT STUFF

  def prepare_subdot
    @dot = Dot.find_by_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create_subdot
    @subdot = Subdot.create(name: params[:subdot][:name],
                            content: params[:subdot][:content],
                            dot_id: params[:subdot][:dot_id])

    respond_to do |format|
      format.js
    end
  end

  # PARAGRAPH STUFF

  def prepare_paragraph
    @subdot = Subdot.find_by_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create_paragraph
    @paragraph = Paragraph.create(name: params[:paragraph][:name],
                                  content: params[:paragraph][:content],
                                  subdot_id: params[:paragraph][:subdot_id])

    respond_to do |format|
      format.js
    end
  end

  def destroy_paragraph
    Paragraph.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /acts/1
  def update
    # if @act.update(act_params)
    #   redirect_to @act, notice: 'Act was successfully updated.'
    # else
    #   render :edit
    # end
    @act_new = @act.dup
    @act_new.save
    @act_new.update(act_params)
    
    respond_to do |format|
      format.js
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

  def intit_heads
    session[:heads] = []
  end

  def add_head_id(id)
    session[:heads] << id
  end

  def remove_head_id(id)
    session[:heads].delete(id)
  end
end
