require "test_helper"

class ProductTest < ActiveSupport::TestCase

  test "description_list" do
    product = Product.new(description: "Green, healthy")
    assert_equal ["Green", "healthy"], product.description_list
  end

  test "is_discounted?" do
    product = Product.new(price: 5)
    assert_equal true, product.is_discounted?
  end

  test "tax" do
    product = Product.new(price: 12)
    assert_equal 1.08, product.tax
  end

  test "total" do
    product = Product.new(price: 12)
    assert_equal 13.08, product.total
  end

  test "friendly_created_at" do
    product = Product.new(created_at: "2025-10-31 01:04:39.727872000 +0000")
    assert_equal "Oct 30, 09:04 pm, 2025", product.friendly_created_at #????
  end
  
  test "friendly_updated_at" do
    product = Product.new(updated_at: "2025-10-31 01:04:39.727872000 +0000")
    assert_equal "Oct 30, 09:04 pm, 2025", product.friendly_updated_at
  end

end
