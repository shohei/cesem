class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def home

  end

  def download_pdf
    send_file "#{Rails.root}/public/complaint_form.pdf", type: "application/pdf", x_sendfile: true
  end
end
