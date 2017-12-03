class ContactForm 
 attr_accessor :name, :email, :message, :phone 
 include ActiveModel::Model
 include ActiveModel::Validations

 

validates :name, :email, :message,  presence: true 
 def initialize(params)
  params.each{|k, v| instance_variable_set("@#{k}", v)}
  
 end

 def process_form
  
  if valid? 
   send_email 
   true
  else
    false 
  end
  
 end


 private 

 def send_email

 end

end