class Supplier < ApplicationRecord

  has_many :products #,dependant: :destroy

  
end
