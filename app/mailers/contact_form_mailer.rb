class ContactFormMailer < ApplicationMailer



  def notify_admin(form)
   @email = form.email 
   @message = form.message
   @phone = form.phone
   @name  = form.name 

   mail(to: Admin.first.email, subject: "New message from #{@name}")
    
  end
end
