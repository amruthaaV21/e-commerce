require 'test_helper'

class ProductTest < ActiveSupport::TestCase
 def setup
    @user = users(:ammu)
    @product = @user.products.build(name:"Cadbury",category:"Chocolate", price: 10.00, quantity: 10, discount: 1.00, user_id: @user.id)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "user id should be present" do
    @product.user_id = nil
    assert_not @product.valid?
  end

  test "product name should be present" do
    @product.name = "   "
    assert_not @product.valid?
  end

  test "product category should be present" do
    @product.category = "   "
    assert_not @product.valid?
  end

  test "product price should be present" do
    @product.price = "   "
    assert_not @product.valid?
  end

  test "product quantity should be present" do
    @product.quantity = "   "
    assert_not @product.valid?
  end

  test "product discount should be present" do
    @product.discount = "   "
    assert_not @product.valid?
  end

  test "name should be at most 30 characters" do
    @product.name = "a" * 31
    assert_not @product.valid?
  end
end

