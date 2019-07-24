class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end


 protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to '/users/sign_in'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def authenticate_admin_user!
    if user_signed_in? && current_user.role=='admin'
      
    else
      redirect_to '/'
    end
  end

  def after_sign_in_path_for(resource)
    all_service_path(current_user) 
  end

  def after_inactive_sign_up_path_for
    puts 'inactive*********'
     sign_up_confirmation_path
  end

  def after_sign_up_path_for
    puts 'active*********'
     sign_up_confirmation_path
  end
end
