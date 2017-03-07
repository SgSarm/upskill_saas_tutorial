class ContactsController < ApplicationController
    
   def new
      @contact = Contact.new #Go to Model -> Contact
   end
   
   def create
      @contact = Contact.new(contact_params)
      if @contact.save
         name  = params[:contact][:name]
         email = params[:contact][:email]
         body = params[:contact][:comments]
         ContactMailer.contact_email(name, email, body).deliver # Sent Email
         flash[:success] = "Message sent." # Flash Success Message
         redirect_to new_contact_path # redirect to blank contact form
      else 
         flash[:danger] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
   end
   
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
   
    
end