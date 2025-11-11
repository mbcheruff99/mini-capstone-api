class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
    render :index
  end

  # def show
  #   @supplier = Product.find(params[:id])
  #   render :show
  # end


end
