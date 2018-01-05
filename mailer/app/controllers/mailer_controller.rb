class MailerController < ApplicationController
  def email
    to = params[:to]
    subject = params[:subject]
    body = params[:body]
    p "to: #{to}, subject: #{subject}, body: #{body}"
    email = SampleMailer.welcome_email
    email.deliver_now
  end
end
