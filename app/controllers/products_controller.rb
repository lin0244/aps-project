class ProductsController < ApplicationController
  respond_to :json

  # PATH: '/products/index'
  # GET - Admin - All Products
  # @return [Aray] JSON Array of products
  def index
    @products = Product.all.to_a
    respond_success_json_data(@products.to_json, {info: 'products index'})
  end

  # PATH: '/products/create'
  # POST - Admin - Add new product
  # @param [JSON] params data: {product: {name, product_type}}
  def create
    @product = Product.new(products_params)
    if @product.save
      respond_success_json
    else
      respond_error_json(@product.errors.full_messages)
    end
  end

  # PATH: '/products/show'
  # GET - Add show product with given id
  # @param [JSON] params data: {product: {id}}
  # @return [Object] JSON with product Object
  def show
    @product = Product.find(params[:id])
    respond_success_json_data(@product.to_json, {info: 'got product'})
  end

  private

  def products_params
    params.require(:product).permit(:id, :name, :product_type)
  end
end
