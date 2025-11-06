require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.count
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "description_list", "price", "is_discounted?", "tax", "total", "friendly_created_at", "friendly_updated_at", "inventory"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: {name: "test", price: 0, description: "testing"}
      assert_response 200
    end
  end

  test "update" do
    product = Product.first
    put "/products/#{product.id}.json", params: {name: "test update"}
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "test update", data["name"]
  end

  test "destroy" do 
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
