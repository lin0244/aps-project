class MaterialsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  # PATH: '/materials/index'
  # GET - All material
  # @return [Array] JSON Array of materials
  def index
    @materials = Material.all.to_a
    respond_success_json_data(@materials.to_json, {info: 'materials index'})
  end

  # PATH: '/materials/create'
  # POST - Add new material
  # @param [JSON] params data: { name, quantity }
  def create
    @material = Material.new(name: params[:name], quantity: params[:quantity])
    if @material.save
      respond_success_json
    else
      respond_error_json(@material.errors.full_messages)
    end
  end

  # PATH: '/materials/show'
  # GET - Show material with given id
  # @param [JSON] params data: { id }
  # @return [Object] JSON with material Object
  def show
    @material = Material.find(params[:id])
    respond_success_json_data(@material.to_json, {info: 'got material'})
  end

  # PATH: '/materials/update'
  # POST - Update material with given id
  # @param [JSON] params data: { id, name, quantity }
  # @return [Object] JSON with material Object
  def update
    @material = Material.find(params[:id])
    if @material.update_attributes(name: params[:name], quantity: params[:quantity])
      respond_success_json_data(@material.to_json, {info: 'updated'})
    else
      render json: { info: 'not updated' }
    end
  end

  # PATH: '/materials/delete'
  # DELETE - delete material with given id
  # @param [JSON] params data: { id }
  def destroy
    @material = Material.find(params[:id])
    render json: { info: 'material deleted' } if @material.destroy
  end
end