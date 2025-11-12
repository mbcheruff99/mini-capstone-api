class Supplier < ApplicationRecord

  has_many :products #,dependant: :destroy

  validates :name, presence: {message: "Cannot be blank"}
  
end
