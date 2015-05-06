class UsersController < ApplicationController
  respond_to :json

  def get_user_status
    if current_user
      render :json => true
    else
      render :json => false
    end
  end

  def index
    @users = User.all.to_a
    respond_success_json_data(@users.to_json, {info: 'users index'})
  end
end