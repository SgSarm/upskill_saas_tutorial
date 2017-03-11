class ProfilesController < ApplicationController
    
    # GET to /users/:user_id/profile_new 
    
    def new 
        @profile = Profile.new
    end
    
    
    # POST to /users/:user_id/profile/
    def create
        # Ensure that we have the user who is filling out form
        @user = User.find( params[:user_id]) #Grab user ID from URL
        # Create profile linked to this specific user
        @profile = @user.build_profile( profile_params )
        if @profile.save
            flash[:success] =  "Profile updated!"
            redirect_to user_path(params[:user_id])
        else
            render action: :new
        end
    end
    
    # GET /users/:user_id/profile/edit(.:format)
    def edit
        @user = User.find(params[:user_id])
        @profile = @user.profile
    end
    #Whitelisting so no one can modify our Profile-Form
    private 
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end
end