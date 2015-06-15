class SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_filter :verify_signed_out_user, only: :destroy
  skip_before_filter :verify_authenticity_token
  acts_as_token_authentication_handler_for User, only: [:destroy]

  # PATH: '/sessions'
  # POST - Creates users session
  # @param [JSON] params data: { email, password }
  def create
    resource = User.find_for_database_authentication(email: params[:email])
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
    current_user.update authentication_token: nil
    sign_out current_user
    render status: 200,
           json: { success: true,
                   info: 'Logged out' }
  end

  # GET - Check user status. Returns true if user is logged in.
  # @return [Boolean]
  def get_user_status
    if current_user
      render json: { status: true, id: current_user.id }
    else
      render :json => false
    end
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
    render :json => {:user => current_user,:status => :ok,:authentication_token => current_user.authentication_token }
  end

end