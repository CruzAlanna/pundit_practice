class ProductsController < ApplicationController
  before_action :authorize_request

  def index
    products = policy_scope(Product)
    render json: products
  end

  def create
    product = Product.create(
      name: params[:name],
      price: params[:price],
      published: true,
      user_id: @current_user.id
    )
    authorize product
    render json: product
  end

  def show
    product = Product.find(params[:id])
    authorize product
    render json: product
  end

  def update
    product = Product.find(params[:id])
    authorize product
    
    product.update(
      name: params[:name] || product.name,
      price: params[:price] || product.price,
      published: params[:published] || product.published
    )
    render json: product
  end

  def destroy
    product = Product.find(params[:id])
    authorize product
    product.destroy!
    head :no_content
  end
end
