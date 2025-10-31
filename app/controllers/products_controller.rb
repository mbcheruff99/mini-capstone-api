class ProductsController < ApplicationController

  def product1
    @product = Product.first
    render template: "products/show"
  end

  def all_products
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find(params["id"])
    render template: "products/show"
  end
  
end