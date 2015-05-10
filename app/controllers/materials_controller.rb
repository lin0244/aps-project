class MaterialsController < ApplicationController
  respond_to :json

  # PATH: '/materials/index'
  # GET - Admin - All material
  # @return [Array] JSON Array of materials
  def index
    @materials = Material.all.to_a
    respond_success_json_data(@materials.to_json, {info: 'materials index'})
  end

  # PATH: '/materials/create'
  # POST - Admin - Add new material
  # @param [JSON] params data: {material: {name, quantity}}
  def create
    @material = Material.new(material_params)
    if @material.save
      respond_success_json
    else
      respond_error_json(@material.errors.full_messages)
    end
  end

  # PATH: '/materials/show'
  # GET - Add show material with given id
  # @param [JSON] params data: {material: {id}}
  # @return [Object] JSON with material Object
  def show
    @material = Material.find(params[:id])
    respond_success_json_data(@material.to_json, {info: 'got material'})
  end

  private

  def material_params
    params.require(:material).permit(:id, :name, :quantity)
  end

end