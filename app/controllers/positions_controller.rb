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
  # @param [JSON] params data: {project: {title}}
  def create
    @position = Position.new(position_params)
    if @position.save
      respond_success_json
    else
      respond_error_json(@position.errors.full_messages)
    end
  end

  # PATH: '/positions/show'
  # GET - Add show position with given id
  # @param [JSON] params data: {position: {id}}
  # @return [Object] JSON with position Object
  def show
    @position = Position.find(params[:id])
    respond_success_json_data(@position.to_json, {info: 'got position'})
  end

  # PATH: '/positions/update'
  # POST - Update position with given id
  # @param [JSON] params data: {position: {id, name, product_type}}
  # @return [Object] JSON with position Object
  def update
    @position = Position.find(params[:id])
    if @position.update_attributes(products_params)
      respond_success_json_data(@position.to_json, {info: 'updated'})
    else
      render json: { info: 'not updated' }
    end
  end

  # PATH: '/positions/delete'
  # DELETE - delete position with given id
  # @param [JSON] params data: {position: { id }}
  def destroy
    @position = Position.find(params[:id])
    render json: { info: 'position deleted' } if @position.destroy
  end

  private

  def position_params
    params.require(:position).permit(:id, :title)
  end

end
