require "test_helper"

class BlogEntryTest < ActiveSupport::TestCase 

	test "should initialize a new blog entry object" do
		blog_entry = BlogEntry.new
	end

	test "should not save the blog entry when title is not given" do
		blog_entry = BlogEntry.new
		blog_entry.body = "The is the body of the blog entry"
		assert_not blog_entry.save
	end

end