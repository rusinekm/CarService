require 'test_helper'
 
class UsersControllerTest < ActionController::TestCase
  
  setup do 
    @user_hash = FactoryGirl.attributes_for(:user)
  end
  teardown do 
  	@user_hash = nil
  end

   test 'adding new user' do 
	   assert_difference("User.count",1) do
     post :create, user:@user_hash
    end
	    assert_response :redirect
	    assert_redirected_to user_path(assigns(:user))  
	 	end

	  test'creating user with wrong params' do
    
   assert_no_difference("User.count") do
   
    post :create, user: @user_hash.merge!(email:nil)
    end
    assert_response :success
    assert_template :new
    
    assert_equal @user_hash[:name],assigns(:user).name
    assert_equal @user_hash[:email],assigns(:user).email
   end

  test 'show existing users' do 
    user = FactoryGirl.create(:user)
    get :show, id: user.id
    assert_response :success 
    assert_template :show
    assert_equal @user_hash[:name],assigns(:user).name
  end

  test 'show user index' do 
	    user = FactoryGirl.create(:user)
	    get :index
	    assert_response :success
	    assert_template :index
	    assert_equal User.count, assigns(:users).count
	end
  
  test 'update user' do 
  	
      assert_difference("User.count",0) do
        patch :update, id: users(:one).id,  user: {name: 'Marcin',
	      surname: 'Smoktunowicz', email: 'email1@wp.pl'}
      end
      assert_response :redirect
      assert_redirected_to user_path(assigns(:user))
      updated_user = User.find(users(:one).id)
      assert_equal 'Marcin', updated_user.name
      assert_equal "email1@wp.pl", updated_user.email
     end
     
end