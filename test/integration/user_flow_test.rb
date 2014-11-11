require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
	def setup 
		Capybara.app_host = 'http://localhost:3000'
		Capybara.default_wait_time = 5
		Capybara.current_driver = :selenium
	end

	test "should submit a new blog entry" do 
		visit(new_blog_entry_path)
		fill_in("Title", :with => "This is the title")
		fill_in("Body", :with => "This is the body")
		fill_in("Tags", :with => "Foo, bar")
		click_on("Create Blog entry")
		assert page.has_content?('This is the title')
	end

	test "should not submit a new blog entry when title is missing" do 
		visit(new_blog_entry_path)
		fill_in("Title", :with => "")
		fill_in("Body", :with => "This is the body")
		fill_in("Tags", :with => "Foo, bar")
		click_on("Create Blog entry")
		assert page.has_content?("Title can't be blank")
	end

	test "should not submit a new blog entry when body is missing" do 
		visit(new_blog_entry_path)
		fill_in("Title", :with => "This is the title")
		fill_in("Body", :with => "")
		fill_in("Tags", :with => "Foo, bar")
		click_on("Create Blog entry")
		assert page.has_content?("Body can't be blank")
	end

	test "should login create a new blog entry and logout" do 
		visit(blog_entries_path)
		click_on("New entry")
		fill_in("Title", :with => "This is the title")
		fill_in("Body", :with => "This is the body")
		fill_in("Tags", :with => "Foo, bar")
		click_on("Create Blog entry")
		click_on("Logout")
		visit(blog_entries_path)
		assert_not page.has_content?("Logout")
	end
end
