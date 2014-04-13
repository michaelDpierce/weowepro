# Load the Rails application.
require File.expand_path('../application', __FILE__)

Weowe::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => "smtp.sendgrid.net",
  :port           => "587",
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
