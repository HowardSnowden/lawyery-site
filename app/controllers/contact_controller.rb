class ContactController < ApplicationController


  def create
    @c = ContactForm.new(contact_params)
    respond_to do |format| 
      if @c.process_form
        ContactFormMailer.notify_admin(@c).deliver_now
        format.js {}
      else 
        format.js {render "errors.js.erb"}
      end
    end
  end

  private 

  def contact_params
    params.require(:contact).permit(:email, :phone, :message, :name)
  end


end
