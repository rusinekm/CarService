require 'test_helper'

class UsersControllerTest < ActionController::TestCase
   
test 'show all users ' do 
	get :index
	assert_response :success
 	assert_template :index
end
 

end
