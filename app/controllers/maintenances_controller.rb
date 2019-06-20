class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  require 'date'

  # GET /maintenances
  # GET /maintenances.json
  def index
    @maintenances = Maintenance.all
  end

  # GET /maintenances/1
  # GET /maintenances/1.json
  def show
  end

  # GET /maintenances/new
  def new
    @maintenance = Maintenance.new
    @equipment = Equipment.find_by_id(params[:equipment_id])
  end

  # GET /maintenances/1/edit
  def edit
  end

  # POST /maintenances
  # POST /maintenances.json
  def create
    @maintenance = Maintenance.new(maintenance_params)
    trace_number = generate_trace_number(@maintenance)
    @maintenance.trace_number = trace_number
    inventory_number = Equipment.find_by_id(@maintenance.equipment_id).inventory_number 

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to "/acknowledgement/?trace_number=#{trace_number}&inventory_number=#{inventory_number}" }
        format.json { render :show, status: :created, location: @maintenance }
      else
        format.html { render :new }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1
  # PATCH/PUT /maintenances/1.json
  def update
    respond_to do |format|
      _maintenance_params = maintenance_params
      last_status = @maintenance.status
      current_status = maintenance_params[:status]
      if(last_status!=current_status) && current_status=='completed'
        _maintenance_params[:completed_at] = Date.today
      end
      if @maintenance.update(_maintenance_params)
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance }
      else
        format.html { render :edit }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    @maintenance.destroy
    respond_to do |format|
      format.html { redirect_to maintenances_url, notice: 'Maintenance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def acknowledgement 
    @trace_number = params[:trace_number]
    @inventory_number = params[:inventory_number]
  end

  def followup
    @maintenances = Maintenance.all
    @q = Maintenance.ransack(params[:q]) 
    if not params[:q].blank? 
      if not params[:q]['trace_number_cont'].blank?
        @search_maintenances = @q.result(distinct: true).order(:created_at).page(params[:page])
      else 
        @search_maintenances = nil
      end
    else
      @search_maintenances = nil
    end
  end

  private
    def generate_trace_number(maintenance)
      year = Date.today.year.to_s
      month = format('%02d', Date.today.month)
      four_digit = format('%04d', Maintenance.count)
      trace_number = "CeSEM/"+month+"/"+four_digit+"/"+year
      return trace_number
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_params
      params.require(:maintenance).permit(:user_id, :equipment_id, :description, :precaution, :trace_number, :diagnosis, :status, :scheduled_at, :completion_expected_at, :recommission_projected_at, :other_status, :completed_at)
    end
end
