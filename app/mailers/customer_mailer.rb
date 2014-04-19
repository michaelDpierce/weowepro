class CustomerMailer < ActionMailer::Base
  default from: "info@weowepro.com"

  def form_approved(user)
  @user = user
    mail(to: @user.email, subject: 'A copy of your due bill for your records.')
  end


  def form_completed(user)
  @user = user
    mail(to: @user.email, subject: 'Your vehicle is ready for pickup!')
  end
end
