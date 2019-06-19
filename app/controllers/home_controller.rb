class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:about, :staff]
  before_action :authenticate_admin_user!, only: [:dashboard]

  def index
    
  end

  def home

  end

  def dashboard

  end

  def staff

  end

  def about

  end

  def download_pdf
    send_file "#{Rails.root}/public/complaint_form.pdf", type: "application/pdf", x_sendfile: true
  end
end
