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
    assert_equal ["id", "name", "description_list", "price", "is_discounted?", "tax", "total", "friendly_created_at", "friendly_updated_at", "inventory", "supplier_id", "supplier"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: {
        name: "test", 
        price: 1, 
        description: "testing", 
        inventory: 23,
        supplier_id: Supplier.first.id
        }
      assert_response 201
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
  end

  test "update" do
    product = Product.first
    put "/products/#{product.id}.json", params: {name: "test", supplier_id: Supplier.first.id}
    assert_response 200
    
    data = JSON.parse(response.body)
    assert_equal "test", data["name"]
    
    put "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do 
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
