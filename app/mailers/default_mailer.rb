class DefaultMailer < ApplicationMailer
  default from: 'notifications@adriencabaud.fr'
  def notify_message
    @message = params[:message]
    @user = @message.user
    @seller = @message.announcement.user

    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
