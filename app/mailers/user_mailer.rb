class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email,
         subject: 'Welcome to My Awesome Site',
         template_path: 'email_users',
         template_name: 'new')
  end

  def goodbye_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email,
         subject: 'Your account has been deleted',
         template_path: 'user_mailer',
         template_name: 'account_deletion_notification')
  end
end
