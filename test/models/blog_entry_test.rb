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

test "should not save the blog entry when body is not given" do
	blog_entry = BlogEntry.new
	blog_entry.title = "The is the title of the blog entry"
	assert_not blog_entry.save
end

#Refactoring so that the model BlogEntry add an "Unspecified" tag if no tag has been added
=begin
	test "should not save the blog entry when the tag_list is empty" do 
		blog_entry = BlogEntry.new
		blog_entry.title = "The is the title of the blog entry"
		blog_entry.body = "The is the body of the blog entry"
		assert_not blog_entry.save		
	end
=end
test "should add a tag with the string Unspecified to the blog entry when no tag has been given after saving" do
	blog_entry = BlogEntry.new
	blog_entry.title = "The is the title of the blog entry"
	blog_entry.body = "The is the body of the blog entry" 
	assert blog_entry.save
	assert blog_entry.tag_list.include?("Unspecified")
end

test "should save a new blog entry" do
	blog_entry = BlogEntry.new
	blog_entry.title = "The is the title of the blog entry"
	blog_entry.body = "The is the body of the blog entry" 
	blog_entry.tag_list.add("Unspecified")
	assert blog_entry.save
end

end