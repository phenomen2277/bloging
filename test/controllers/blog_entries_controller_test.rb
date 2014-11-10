class BlogEntriesControllerTest < ActionController::TestCase

	def setup
		@blog_entry = BlogEntry.create(title: "Testing", body: "This is the body")
	end

	def teardown
		@blog_entry.destroy
	end

	test "should render index" do
		get :index
		assert_response :success
	end

	test "should render new" do 
		get :new
		assert_response :success
	end

	test "should create new blog entry" do 
		post :create, blog_entry: { body: @blog_entry.body, title: @blog_entry.title, tag_list: :tag_one }
		assert_redirected_to blog_entries_path
	end

	test "should not create new blog entry" do 
		@blog_entry.expects(:title).at_least(1).returns(nil)
		post :create, blog_entry: { body: @blog_entry.body, title: @blog_entry.title, tag_list: :tag_one }
		assert_response :forbidden
	end

	test "should show the blog entry" do
		get :show, :id => BlogEntry.first.id
		assert_response :success
	end

	test "should not show the blog entry" do
		get :show, :id => "foo"
		assert_response :forbidden
	end

	test "should render edit" do
		get :edit, :id => @blog_entry
		assert_response :success
	end

	test "should update blog entry" do
		@blog_entry.expects(:title).at_least(1).returns("Title (Updated)")
		@blog_entry.expects(:body).at_least(1).returns("Body (Updated)")
		patch :update, :id => @blog_entry, blog_entry: {title: @blog_entry.title , body: @blog_entry.body, tag_list: :tag_one} 
		assert_response :accepted
	end

	test "should destroy blog entry" do
		delete :destroy, id: @blog_entry
		assert_redirected_to blog_entries_path
	end

	test "should not destroy blog entry" do
		delete :destroy, id: "foo"
		assert_response :forbidden
	end
end