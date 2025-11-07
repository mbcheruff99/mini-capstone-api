class Product < ApplicationRecord

  validates :name, presence: true
  validates :price, numericality: {greater_than: 0 }

  #forbidden words custom method

    FORBIDDEN_WORDS = ["stuff", "bomb"]
    validate :description_cannot_contain_forbidden_words 
    private
    def description_cannot_contain_forbidden_words
      return if description.blank?

      FORBIDDEN_WORDS.each do |word|
        if description.downcase.include?(word)
          errors.add(:description, "contains a forbiden word: '#{word}'")
        end
      end
    end


  # end custom method

  def description_list
    description.split(", ")
  end

  def is_discounted?
    if price <= 10
      true
    else
      false
    end
  end

  def tax
    tax = price * 0.09
    tax = tax.round(2)
  end

  def total 
    total = tax + price
    
  end

  def friendly_created_at
    created_at.in_time_zone('Eastern Time (US & Canada)').strftime("%b %-d, %I:%M %P, %Y")
  end

  def friendly_created_at
    created_at.in_time_zone('Eastern Time (US & Canada)').strftime("%b %-d, %I:%M %P, %Y")
  end
  
  def friendly_updated_at
    updated_at.in_time_zone('Eastern Time (US & Canada)').strftime("%b %-d, %I:%M %P, %Y")
  end

end



