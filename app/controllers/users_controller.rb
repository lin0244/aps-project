class UsersController < ApplicationController
  respond_to :json

  def get_user_status
    if current_user
      render :json => true
    else
      render :json => false
    end
  end
end