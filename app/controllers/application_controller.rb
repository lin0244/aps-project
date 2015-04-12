class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

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
end
