class RegistrationsController < Devise::RegistrationsController

	# Send email confirmation after User create
	def create
		super
		UserMailer.user_welcome(resource).deliver_now unless resource.invalid?
	end

  private
  	# Params for sign up
	  def sign_up_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

	  # Params for profile update
	  def account_update_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
	  end		

	protected
		# Path after sign up
	  def after_sign_up_path_for(resource)
	  	user_path(resource)
  	end	  
end