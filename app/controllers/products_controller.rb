class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end
  
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory]
    )
      if @product.save
      render :show, status: :created
      else 
        render json: { errors: @product.errors }, status: :unprocessable_entity
      end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
    name: params[:name] || @product.name,
    price: params[:price] || @product.price,
    description: params[:description] || @product.description,
    inventory: params[:inventory] || @product.inventory
    )
    if @product.valid?
     render :show
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
    render json: {message: "Product Successfully Deleted"}
  end



end