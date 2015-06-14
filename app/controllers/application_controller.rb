class ApplicationController < ActionController::Base
  skip_before_filter :verify_authenticity_token


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
