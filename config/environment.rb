# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Weowe::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app22681995@heroku.com',
  :password       => 'Wasd1313!',
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

  # Use these once you figure out the variable/yml thing
  # :user_name      => ENV['SENDGRID_USERNAME'],
  # :password       => ENV['SENDGRID_PASSWORD'],
