class UsersController < ApplicationController
  respond_to :json

  # GET - Check user status. Returns true if user is logged in.
  # @return [Boolean]
  def get_user_status
    puts ' get status:'
    if current_user
      puts 'true'
      render json: { status: true, id: current_user.id }
    else
      puts 'false'
      render :json => false
    end
  end

  # GET - Check if user is an intern
  # @return [Boolean]
  def check_intern
    if current_user.intern?
      render :json => true
    else
      render :json => false
    end
  end

  # GET -  Array with all users.
  # @return [Array] JSON Array with all users
  def index
    @users = User.all.to_a
    @users = @users.map do |user|
      position = user.position.title
      {
        id:           user.id,
        email:  user.email,
        name:       user.name,
        surname:  user.surname,
        position_id: user.position_id,
        position: position,
        admin: user.admin
      }
    end
    respond_success_json_data(@users.to_json, {info: 'users index'})
  end

  # GET - Array with all users with given position.
  # @param [JSON] params data: { position_id }
  # @return [Array] JSON Array with all users
  def position_index
    @users = User.where(position_id: params[:position_id]).all.to_a
    respond_success_json_data(@users.to_json, {info: 'users index by position'})
  end

  # GET - Array with all managers.
  # @return [Array] JSON Array with all managers
  def managers
    @position_id = Position.where(title: 'manager').first.id
    @users = User.where(position_id: @position_id).all.to_a
    respond_success_json_data(@users.to_json, {info: 'managers'})
  end



  # PATH: '/users/delete'
  # DELETE - delete user with given id
  # @param [JSON] params data:  { id }
  def destroy
    @user = User.find(params[:id])
    render json: { info: 'user deleted' } if @user.destroy
  end
end