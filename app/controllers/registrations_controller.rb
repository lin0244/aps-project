class RegistrationsController < Devise::SessionsController
  #acts_as_token_authentication_handler_for User
  respond_to :json

  # Path: /registrations
  # POST - User & Admin - Registration action. User can register to application or Admin can add the user.
  # @param [JSON] params data: { user: { email, password, password_confirmation, name, surname, position_id, admin } }
  def create
    user = User.new(user_params)
    if user.save
      render status: 200, json: user
    else
      warden.custom_failure!
      render status: 422, json: {
        errors: user.errors
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname, :position_id, :admin)
  end

end