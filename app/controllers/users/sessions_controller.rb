class Users::SessionsController < Devise::SessionsController
  def resource_params
    params.permit(:user).permit(:email, :password)
  end
  private :resource_params
end
