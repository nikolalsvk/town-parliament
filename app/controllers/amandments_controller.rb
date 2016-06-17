class AmandmentsController < ApplicationController
  before_action :set_amandment, only: [:show, :edit, :update, :destroy]

  # GET /amandments
  def index
    @amandments = Amandment.all
  end

  # GET /amandments/1
  def show
    @act = Act.find(@amandment.owner_id)

    redirect_to @act
  end

  # GET /amandments/new
  def new
    @amandment = Amandment.new
    @meeting = Meeting.find(1)
  end

  # GET /amandments/1/edit
  def edit
  end

  # POST /amandments
  def create
    @amandment = Amandment.new(amandment_params)
    @amandment.user = current_user

    if @amandment.save
      redirect_to @amandment, notice: 'Amandment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /amandments/1
  def update
    if @amandment.update(amandment_params)
      redirect_to @amandment, notice: 'Amandment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /amandments/1
  def destroy
    client.send_corona_request("/v1/documents?database=Tim22&uri=/amandments/amandment_#{@amandment.id}.xml", :delete)
    @amandment.destroy
    redirect_to amandments_url, notice: 'Amandment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amandment
      @amandment = Amandment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def amandment_params
      params.require(:amandment).permit(:date, :content, :explanation, :rating, :act_id, :owner_id)
    end
end
