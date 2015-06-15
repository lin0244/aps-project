class SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!
  respond_to :json
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  # PATH: '/sessions'
  # POST - Creates users session
  # @param [JSON] params data: { email, password }
  def create
    puts params
    resource = User.find_for_database_authentication(email: params[:email])
    puts resource.valid_password?(params[:password])
    if resource.valid_password?(params[:password])
      if sign_in(:user, resource)
        login_successful_for(current_user)
      else
        wrong_data
      end
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

  def failure
    warden.custom_failure!
    render status: 401, json: { success: false, message: "Error with your login or password"}
  end

  def wrong_data
    warden.custom_failure!
    render status: 401, json: { success: false, message: "Can't sign in"}
  end

  protected
  def ensure_params_exist
    return unless params[:user].blank?
    render json: {success: false, message: "missing user login parameters"}, :status=>422
  end

  private

  # def user_params
  #   params.require(:user).permit(:email, :password)
  # end

  def login_successful_for(user)
    render status: 200, json: { success: true, info: 'Logged in'}
  end

end