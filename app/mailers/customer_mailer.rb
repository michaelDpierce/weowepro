class CustomerMailer < ActionMailer::Base
  default from: "info@weowepro.com"

  def form_approved(user)
      mail(to: user, subject: 'A copy of your due bill for your records.')
  end


  def form_completed(user)
    mail(to: user, subject: 'Your vehicle is ready for pickup!')
  end
end
