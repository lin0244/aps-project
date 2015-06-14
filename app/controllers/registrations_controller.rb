class RegistrationsController < Devise::SessionsController
  respond_to :json

  # Path: /registrations
  # POST - Registration action. User can register to application or Admin can add the user. admin is a boolean field, send true if user is an admin.
  # @param [JSON] params data: { email, password, password_confirmation, name, surname, position_id, admin }
  def create
    puts params
    user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], surname: params[:surname], position_id: params[:position_id], admin: params[:admin])
    if user.save
      render status: 200, json: user
    else
      warden.custom_failure!
      render status: 422, json: {
        errors: user.errors
      }
    end
  end
end