class CustomerMailer < ActionMailer::Base

  def form_approved(weowe_form, domain)
    @weowe_form = weowe_form
    mail(to: @weowe_form.customer_email, from: "Sales@#{domain}",
         subject: "A copy of your due bill from #{Time.now} for your records.")
  end

  def form_completed(weowe_form, domain)
    @weowe_form = weowe_form
    mail(to: @weowe_form.customer_email, from: "Service@#{domain}",
         subject: "Your vehicle is ready for pickup!. #{Time.now}")
  end
end
