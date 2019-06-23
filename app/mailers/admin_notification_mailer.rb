class AdminNotificationMailer < ApplicationMailer
  default from: "cesem@jkuat.ac.ke"

  def send_mail_new_maintenance_created(maintenance)
    @maintenance = maintenance
    @user = User.find_by_id(maintenance.user_id)
    admin_email = ENV['ADMIN_EMAIL'] 
    mail(
      subject: "New maintenance request received",
      to: admin_email
    ) do |format|
        format.html
      end
  end

end
