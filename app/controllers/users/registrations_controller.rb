class Users::RegistrationsController < Devise::RegistrationsController

	private

  def sign_up_params
    user_params
  end

  def account_update_params
    user_params
  end

  def user_params
    params.require(:user).permit(
      :email, :username, :password, :password_confirmation
    )
  end
  
  protected

  def after_sign_up_path_for(resource)
    '/account'
  end
end