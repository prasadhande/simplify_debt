require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	User.delete_all
	  users = [{ first_name: 'Andrew', last_name: 'Jo' }, { first_name: 'Joel', last_name: 'Dey' }, { first_name: 'Adam', last_name: 'kher' }]

	  test 'should get index' do
	    get userss_url, as: :json
	    assert_response :success
	  end

	  test 'should create user' do
	    assert_difference 'User.count', 3 do
	      users.each do |user|
	        post users_url, params: { user: user }, as: :json
	      end
	    end
	    assert_response 201
	  end

	  test 'should show user' do
	    User.all.each do |user|
	      get user_url(user), as: :json
	      assert_response :success
	    end
	  end

	  test 'should update user' do
	    user = User.first
	    put user_url(user), params: { user: { first_name: 'Andrew GO' } }
	    assert_response :success
	  end

	  test 'should destroy user' do
	    user = User.first
	    delete user_url(user)
	    assert_response :success
	  end
  # test "the truth" do
  #   assert true
  # end
  # test "the truth" do
  #   assert true
  # end
end
