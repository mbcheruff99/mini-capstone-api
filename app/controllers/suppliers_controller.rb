class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @supplier = Supplier.find(params[:id])
    render :show
  end

  def create
    @supplier = Supplier.new(
      name: params[:name]
    )

    if @supplier.save
      render :show
    else
      render json: { errors: @supplier.errors }, status: :unprocessable_entity
    end
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier.update(
      name: params[:name] || @supplier.name
    )
    
    if @supplier.valid?
      render :show
    else
      render json: {errors: @supplier.errors }, status: :unprocessable_entity
    end
  
  end

    def destroy
      @supplier = Supplier.find(params[:id])
      @supplier.destroy
      render json: {message: "Supplier successfully deleted"}
    end

end
