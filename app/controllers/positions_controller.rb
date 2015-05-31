class PositionsController < ApplicationController
  respond_to :json

  # PATH: '/positions/index'
  # GET - All positions
  # @return [Array] JSON Array of positions
  def index
    @positions = Position.all.to_a
    respond_success_json_data(@positions.to_json, {info: 'positions index'})
  end

  # PATH: '/positions/create'
  # POST - Add new project
  # @param [JSON] params data: { title }
  def create
    @position = Position.new(title: params[:title])
    if @position.save
      respond_success_json
    else
      respond_error_json(@position.errors.full_messages)
    end
  end

  # PATH: '/positions/show'
  # GET - Add show position with given id
  # @param [JSON] params data: { id }
  # @return [Object] JSON with position Object
  def show
    @position = Position.find(params[:id])
    respond_success_json_data(@position.to_json, {info: 'got position'})
  end

  # PATH: '/positions/update'
  # POST - Update position with given id
  # @param [JSON] params data: { id, title }
  # @return [Object] JSON with position Object
  def update
    @position = Position.find(params[:id])
    if @position.update_attributes(title: params[:title])
      respond_success_json_data(@position.to_json, {info: 'position updated'})
    else
      render json: { info: 'not updated' }
    end
  end

  # PATH: '/positions/delete'
  # DELETE - delete position with given id
  # @param [JSON] params data: { id }
  def destroy
    @position = Position.find(params[:id])
    render json: { info: 'position deleted' } if @position.destroy
  end
end
