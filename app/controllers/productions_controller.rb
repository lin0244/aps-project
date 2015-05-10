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
  # @param [JSON] params data: {production: {product_id, project_id, quantity}}
  def create
    @production = Production.new(production_params)
    if @production.save
      respond_success_json
    else
      respond_error_json(@production.errors.full_messages)
    end
  end

  # PATH: '/productions/show'
  # GET - Add show produciont with given id
  # @param [JSON] params data: {production: {id}}
  # @return [Object] JSON with production Object
  def show
    @production = Production.find(params[:id])
    respond_success_json_data(@production.to_json, {info: 'got production'})
  end

  private

  def production_params
    params.require(:production).permit(:id, :product_id, :project_id, :quantity)
  end
end