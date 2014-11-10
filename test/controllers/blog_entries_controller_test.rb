class BlogEntriesControllerTest < ActionController::TestCase

	test "should render index" do
		get :index
		assert_response :success
	end

	test "should render new" do 
		get :new
		assert_response :success
	end


end