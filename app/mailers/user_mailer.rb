class UserMailer < ActionMailer::Base
  #include SendGrid

  default from: "info@weowepro.com"

  def service_completed_email(user)
      @user = user
      mail( :to => @user.email,
      :subject => 'Your car is ready for pickup!' )
  end
end
