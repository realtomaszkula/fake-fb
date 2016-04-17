class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@fakefb.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
          subject: 'Welcome to fakefb - fake social network')
  end

end
