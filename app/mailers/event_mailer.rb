class EventMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def event_email(params)
    @email = Event.find(params[:id].to_i).admin.email
    @url = 'http://monsite.fr/login'
    mail(to: @email, subject: 'Bienvenue chez nous !')
  end
end
