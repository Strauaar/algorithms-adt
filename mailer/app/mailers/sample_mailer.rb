class SampleMailer < ApplicationMailer

  def welcome_email
    mail(to: "astrauli@gmail.com", subject: 'Hi')
  end
end
