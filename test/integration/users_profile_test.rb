require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:ammu)
    @other_user = users(:raji)
  end

  test "profile display" do
    log_in_as(@other_user)
    get user_path(@user)
    assert_redirected_to root_url
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_select 'div.pagination'
    @user.products.paginate(page: 1).each do |product|
      assert_match product.name, response.body
      
    end
  end
end
