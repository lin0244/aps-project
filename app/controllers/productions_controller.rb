class ProductionsController < ApplicationController
  respond_to :json

  # PATH: '/productions/index'
  # GET - All Productions
  # @return [Aray] JSON Array of productions
  def index
    @productions = Production.all.to_a
    respond_success_json_data(@productions.to_json, {info: 'productions index'})
  end

  # PATH: '/productions/create'
  # POST - Add new production
  # @param [JSON] params data: { product_id, project_id, quantity }
  def create
    @production = Production.new(product_id: params[:product_id], project_id: params[:project_id], quantity: params[:quantity])
    if @production.save
      respond_success_json
    else
      respond_error_json(@production.errors.full_messages)
    end
  end

  # PATH: '/productions/show'
  # GET - Add show production with given id
  # @param [JSON] params data: { id }
  # @return [Object] JSON with production Object
  def show
    @production = Production.find(params[:id])
    respond_success_json_data(@production.to_json, {info: 'got production'})
  end

  # PATH: '/productions/update'
  # POST - Update production with given id
  # @param [JSON] params data: { id, product_id, project_id, quantity }
  # @return [Object] JSON with production Object
  def update
    @production = Production.find(params[:id])
    if @production.update_attributes(product_id: params[:product_id], project_id: params[:project_id], quantity: params[:quantity])
      respond_success_json_data(@production.to_json, {info: 'updated'})
    else
      render json: { info: 'not updated' }
    end
  end

  # PATH: '/productions/delete'
  # DELETE - delete production with given id
  # @param [JSON] params data: { id }
  def destroy
    @production = Production.find(params[:id])
    render json: { info: 'production deleted' } if @production.destroy
  end
end