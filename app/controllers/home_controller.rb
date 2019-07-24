class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :staff]
  before_action :authenticate_admin_user!, only: [:dashboard]

  def index
    
  end

  def home

  end

  def service

  end

  def dashboard
    @q = Maintenance.ransack(params[:q]) 
    @search_maintenances = @q.result(distinct: true).where(completed_at: nil).page(params[:page]) 
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
