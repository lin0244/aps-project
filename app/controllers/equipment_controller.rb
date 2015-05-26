class EquipmentController < ApplicationController
  respond_to :json

  # PATH: '/equipment/index'
  # GET - get euipment
  # @return [Array] JSON Array of equipment
  def index
    @equipment = Equipment.all.to_a
    respond_success_json_data(@equipment.to_json, {info: 'equipment index'})
  end

  # PATH: '/equipment/create'
  # POST - Add new project
  # @param [JSON] params data: {name, eq_type}
  def create
    @equipment = Equipment.new(name: params[:name], eq_type: params[:eq_type])
    if @project.save
      respond_success_json
    else
      respond_error_json(@equipment.errors.full_messages)
    end
  end

  # PATH: '/equipment/show'
  # GET - Add show project with given id
  # @param [JSON] params data: { id }
  # @return [Object] JSON with equipment Object
  def show
    @equipment = Equipment.find(params[:id])
    respond_success_json_data(@equipment.to_json, {info: 'got equipment'})
  end

  # PATH: '/equipment/update'
  # POST - Update equipment with given id
  # @param [JSON] params data: {id, name, eq_type}
  # @return [Object] JSON with equipment Object
  def update
    @equipment = Equipment.find(params[:id])
    if @equipment.update_attributes(name: params[:name], eq_type: params[:eq_type])
      respond_success_json_data(@equipment.to_json, {info: 'updated'})
    else
      render json: { info: 'not updated' }
    end
  end

  # PATH: '/equipment/delete'
  # DELETE - delete equipment with given id
  # @param [JSON] params data: { id }
  def destroy
    @equipment = Equipment.find(params[:id])
    render json: { info: 'equipment deleted' } if @equipment.destroy
  end
end