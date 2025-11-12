require "test_helper"

class SuppliersControllerTest < ActionDispatch::IntegrationTest
 
  test "index" do 
    get "/suppliers.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Supplier.count, data.count
  end

  test "show" do
    get "/suppliers/#{Supplier.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "products"], data.keys
  end

  test "created" do
    assert_difference "Supplier.count", 1 do
      post "/suppliers.json", params: {
        name: "test"
      }
      assert_response 200
    end
    
    assert_difference "Supplier.count", 0 do
      post "/suppliers.json", params: {}
      assert_response 422
    end
  end
  
  # test "update" do 

  # end
end
