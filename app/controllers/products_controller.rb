class ProductsController < ApplicationController
  caches_action :show
  caches_page :index

  def index
    @products = Product.all

    render json: @products, cached: true
  end

  def show
    @product = Product.find_by(id: params[:id])  || NullProduct.new

    render json: @product
  end

  def create
    @product = Product.new(product_params)
    render json: 'sorry, you can not create idea for someone else', status: :unprocessable_entity if current_user.is_admin?

    if @product.save
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
end
