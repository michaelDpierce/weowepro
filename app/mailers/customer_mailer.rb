class CustomerMailer < ActionMailer::Base
  default from: 'info@weowepro.com'

  def form_approved(weowe_form)
    @weowe_form = weowe_form
    mail(to: @weowe_form.customer_email, from: 'Sales@cdodge.com',
         subject: "A copy of your due bill from #{Time.now.strftime '%d/%m/%y'} for your records.")
  end

  def form_completed(weowe_form)
    @weowe_form = weowe_form
    mail(to: @weowe_form.customer_email, from: 'Service@cdodge.com',
         subject: "Your vehicle is ready for pickup!. #{Time.now.strftime '%d/%m/%y'}")
  end
end
