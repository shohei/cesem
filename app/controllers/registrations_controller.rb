class RegistrationsController  < Devise::RegistrationsController
 protected

  def after_sign_up_path_for(resource)
    sign_up_confirmation_path
  end

  def after_inactive_sign_up_path_for(resource)
    sign_up_confirmation_path
  end
end
