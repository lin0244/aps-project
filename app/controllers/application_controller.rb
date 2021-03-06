class ApplicationController < ActionController::Base
  #acts_as_token_authentication_handler_for User
  skip_before_filter :verify_authenticity_token
  protect_from_forgery with: :null_session
  before_action :add_headers


  def add_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end


  def respond_success_json_data(data, options = {})
    opts = success_default_options.merge(options)
    render json: { info: opts[:info], success: opts[:success], status: opts[:status], data: data }
  end

  def respond_success_json(options = {})
    opts = success_default_options.merge(options)
    render json: { info: opts[:info], success: opts[:success], status: opts[:status] }
  end

  def respond_error_json(data, options = {})
    opts = error_default_options.merge(options)
    render json: { info: opts[:info], success: opts[:success], status: opts[:status], data: data }
  end

  private

  def permission_denied
    head 403
  end

  def error_default_options
    {
      status: 442,
      success: false,
      info: 'failure'
    }
  end

  def success_default_options
    {
      status: 200,
      success: true,
      info: 'success'
    }
  end

  def index ; end
end
