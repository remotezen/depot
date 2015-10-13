require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)

      @hash = {name: "Fred Hudson",
                          password: 'secret',
                          password_confirmation: 'secret'} 
  end
  
  test "Should have a user form" do
    get :new
    assert_response :success
    assert_template 'users/new'
  end

  test "Should create a user" do
    assert_difference('User.count') do
      post :create, user: @hash
    assert_not flash.empty?
      assert_redirected_to users_path

    end
  end
  test "User names should be unique" do
      user = post :create, user: @hash
      user2 = post :create, user: @hash 
      assert_equal user, user2
  end
  test "should create user" do
    assert_difference('User.count') do
      post :create,  user:{name: 'sam', password: 'secret',
     password_confirmation: 'secret' }
    end
    assert_redirected_to users_path
  end
  test "should update user" do
    assert_redirected_to 
    patch :update, id:@user, user:{name:"fred", password: 'secret',
    password_confirmation: 'secret'}
    assert_redirected_to users_path
  end
  test "no sensitive data for logged out user" do
    logout
    get :users
    
  end


end
