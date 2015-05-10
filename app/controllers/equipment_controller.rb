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
  # POST - Admin - Add new project
  # @param [JSON] params data: {project: {name, eq_type}}
  def create
    @equipment = Equipment.new(equipment_params)
    if @project.save
      respond_success_json
    else
      respond_error_json(@equipment.errors.full_messages)
    end
  end

  # PATH: '/equipment/show'
  # GET - Add show project with given id
  # @param [JSON] params data: {equipment: {id}}
  # @return [Object] JSON with equipment Object
  def show
    @equipment = Equipment.find(params[:id])
    respond_success_json_data(@equipment.to_json, {info: 'got equipment'})
  end

  private

  def equipment_params
    params.require(:equpiment).permit(:id, :name, :eq_type)
  end

end