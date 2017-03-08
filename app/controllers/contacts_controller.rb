class ContactsController < ApplicationController
   
   # GET request to /contact-us
   # Show new contact form
   def new
      @contact = Contact.new #Go to Model -> Contact
   end
   
   # POST request  /contacts
   def create
      # Mass assignment of form fields into Contact object
      @contact = Contact.new(contact_params)
      # Save the contact object to the database
      if @contact.save
         # If condition is true, store form fields via paramaters in variables
         name  = params[:contact][:name]
         email = params[:contact][:email]
         body = params[:contact][:comments]
         # Plug variables into the Contact Mailer email method and send email
         ContactMailer.contact_email(name, email, body).deliver 
         # Flash Success Message in flash hash
         flash[:success] = "Message sent."
         # and redirect to the new action
         redirect_to new_contact_path # redirect to blank contact form
      else 
         # If contact object doesn't save,
         # store errors in flash hash
         # and redirect to the new action
         flash[:danger] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
   end
   
   private
      # To collect data from form, we need to use
      # strong parameteres
      # and whitelist the form fields
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
   
    
end