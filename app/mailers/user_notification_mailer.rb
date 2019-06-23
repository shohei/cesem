class UserNotificationMailer < ApplicationMailer
  default from: "cesem@jkuat.ac.ke"

  def send_mail_new_maintenance_confirmed(maintenance)
    @maintenance = maintenance
    @user = User.find_by_id(maintenance.user_id)
    mail(
      subject: "Maintenance request accepted",
      to: @user.email,
    ) do |format|
        format.html
      end
  end

  def send_mail_maintenance_updated(maintenance)
    @maintenance = maintenance
    @user = User.find_by_id(maintenance.user_id)
    mail(
      subject: "Maintenance status updated",
      to: @user.email,
    ) do |format|
        format.html
      end
  end
end
