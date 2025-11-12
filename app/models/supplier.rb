class Supplier < ApplicationRecord

  # has_many :products #,dependant: :destroy

  def products
    Product.where(supplier_id: id)
  end

  validates :name, presence: {message: "Cannot be blank"}
  
end
