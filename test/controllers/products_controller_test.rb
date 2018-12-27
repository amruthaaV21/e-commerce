require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = products(:choci)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Product.count' do
      post products_path, params: { product: { name: "Cadbury", category: "Chocolate", price: 10.00, quantity: 10, discount: 10.00 } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Product.count' do
      delete product_path(@product)
    end
    assert_redirected_to login_url
  end

  
end
