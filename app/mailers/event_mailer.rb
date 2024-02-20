class EventMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def welcome_email(user)
    @user = user
    @url = 'http://monsite.fr/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
