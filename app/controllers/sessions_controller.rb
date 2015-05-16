class SessionsController < Devise::SessionsController
  #acts_as_token_authentication_handler_for User
  #before_filter :ensure_params_exist
  skip_before_filter :verify_signed_out_user
  respond_to :json

  # PATH: '/sessions'
  # POST - Creates users session
  # @param [JSON] params data: {user: {email, password}}
  def create
    if warden.authenticate(scope: resource_name, recall: "#{controller_path}#failure")
      login_successful_for(current_user)
    else
      failure
    end
  end

  # PATH: '/logout'
  # DELETE - Destroys users session
  def destroy
    warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
    sign_out current_user
    render status: 200,
           json: { success: true,
                   info: 'Logged out' }
  end

  # GET /api/v1/failure(.:format)
  def failure
    warden.custom_failure!
    render status: 401, json: { success: false, message: "Error with your login or password"}
  end

  protected
  def ensure_params_exist
    return unless params[:user].blank?
    render json: {success: false, message: "missing user login parameters"}, :status=>422
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def login_successful_for(user)
    render status: 200, json: { success: true, info: 'Logged in'}
  end

end