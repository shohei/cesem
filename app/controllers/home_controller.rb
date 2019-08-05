class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :staff, :sign_up_confirmation]
  before_action :authenticate_admin_user!, only: [:dashboard]

  def index
    
  end

  def home

  end


  def summary
    @q = Maintenance.ransack(params[:q]) 
    
    if(params[:report])
      @month = params[:report]["month(2i)"]
      @year = params[:report]["year(1i)"]
    else
      @month = ''
      @year = Date.today.year
    end

    if(@month.blank?)
      @month_name = ''
      if (@year.blank?) 
        # month and year is blank -> use this year
        beginning_of_month = Date.today.beginning_of_year
        beginning_of_last_month = Date.today.end_of_year.next_month
        @requested_maintenances = @q.result(distinct: true).where(created_at: beginning_of_month..beginning_of_last_month).page(params[:page]) 
        @completed_maintenances = @q.result(distinct: true).where(created_at: beginning_of_month..beginning_of_last_month).where.not(completed_at: nil).page(params[:page]) 
      else
        # month blank but year exists -> use parameter year
        beginning_of_year = Date.new(@year.to_i)
        beginning_of_last_month = beginning_of_year.end_of_year
        @requested_maintenances = @q.result(distinct: true).where(created_at: beginning_of_year..beginning_of_last_month).page(params[:page]) 
        @completed_maintenances = @q.result(distinct: true).where(created_at: beginning_of_year..beginning_of_last_month).where.not(completed_at: nil).page(params[:page]) 

      end
    else
      @month_name = Date::MONTHNAMES[@month.to_i]
      beginning_of_month = Date.new(@year.to_i,@month.to_i,1)
      beginning_of_next_month = beginning_of_month.next_month
      @requested_maintenances = @q.result(distinct: true).where(created_at: beginning_of_month..beginning_of_next_month).page(params[:page]) 
      @completed_maintenances = @q.result(distinct: true).where(created_at: beginning_of_month..beginning_of_next_month).where.not(completed_at: nil).page(params[:page]) 
    end

    ids = @requested_maintenances.pluck(:equipment_id)
    tmp_equipments = Equipment.find(ids)
    new_equipments = ids.map {|x| tmp_equipments.detect {|b| b.id == x } }
    ids = new_equipments.pluck(:department_id)
    tmp_departments = Department.find(ids)
    new_departments = ids.map {|x| tmp_departments.detect {|b| b.id == x } }
    ary = new_departments.pluck(:name)
    @departments = ary.each_with_object(Hash.new(0)){|v,o| o[v]+=1}

    ids = @completed_maintenances.pluck(:equipment_id)
    tmp_equipments = Equipment.find(ids)
    new_equipments = ids.map {|x| tmp_equipments.detect {|b| b.id == x } }
    ids = new_equipments.pluck(:department_id)
    tmp_departments = Department.find(ids)
    new_departments = ids.map {|x| tmp_departments.detect {|b| b.id == x } }
    ary = new_departments.pluck(:name)
    @departments2 = ary.each_with_object(Hash.new(0)){|v,o| o[v]+=1}

  end
  
  def service

  end

  def sign_up_confirmation

  end

  def dashboard
    @q = Maintenance.ransack(params[:q]) 
    @search_maintenances = @q.result(distinct: true).where(completed_at: nil).where(canceled_at: nil).page(params[:page]) 
    @search_maintenances_completed = @q.result(distinct: true).where.not(completed_at: nil).page(params[:page]) 
    @search_maintenances_canceled = @q.result(distinct: true).where.not(canceled_at: nil).page(params[:page]) 
  end

  def staff

  end

  def about

  end

  def download_pdf
    send_file "#{Rails.root}/public/complaint_form.pdf", type: "application/pdf", x_sendfile: true
  end
end
