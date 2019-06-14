class EquipmentsController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  # GET /equipments
  # GET /equipments.json
  def index
    # @equipments = Equipment.all
    @equipments = Equipment.paginate(page: params[:page], per_page: 10)
  end

  # GET /equipments/1
  # GET /equipments/1.json
  def show
  end

  # GET /equipments/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipments/1/edit
  def edit
  end

  # POST /equipments
  # POST /equipments.json
  def create
    @equipment = Equipment.new(equipment_params)

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Equipment was successfully created.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipments/1
  # PATCH/PUT /equipments/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipments/1
  # DELETE /equipments/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipments_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:user_id, :name, :name_of_model, :model_number, :serial_number, :inventory_number, :acquired_at, :location, :manufacturer, :country_of_origin, :warranty_period, :additional_info, :other_info, :dealer_id)
    end
end
