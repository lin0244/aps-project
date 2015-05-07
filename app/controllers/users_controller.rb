class UsersController < ApplicationController
  respond_to :json

  # GET - Admin - Check user status. Returns true if user is logged in.
  # @return [Boolean]
  def get_user_status
    if current_user
      render :json => true
    else
      render :json => false
    end
  end

  # GET - Admin - Array with all users.
  # @return [Array] JSON Array with all users
  def index
    @users = User.all.to_a
    respond_success_json_data(@users.to_json, {info: 'users index'})
  end
end