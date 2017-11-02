require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase
  test "index action should be success" do
    get :index
    assert_response :success
  end

  test "new should be success" do
    get :new
    assert_response :success
  end

  # test "show should be success" do
  #   post = posts(:hello_world)

  #   get :show, id: post.id
  #   assert_response :success
  # end
end
