class Product < ApplicationRecord

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



