class ProductsController < ApplicationController
  respond_to :json

  # PATH: '/products/index'
  # GET - Admin - All Products
  # @return [Aray] JSON Array of products
  def index
    @products = Product.all.to_a
    respond_success_json_data(@products.to_json, {info: 'products index'})
  end

end