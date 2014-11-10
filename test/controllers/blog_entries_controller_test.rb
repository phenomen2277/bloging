class BlogEntriesControllerTest < ActionController::TestCase

	test "should render index" do
		get :index
		assert_response :success
	end

	test "should render new" do 
		get :new
		assert_response :success
	end

	test "should create new blog entry" do 
	be = blog_entries(:one)
	BlogEntry.expects(:new).returns(be)

	@blog_entry = BlogEntry.new

	post :create, blog_entry: { body: @blog_entry.body, title: @blog_entry.title, tag_list: :tag_one }
	assert_response :success
	
	end


end