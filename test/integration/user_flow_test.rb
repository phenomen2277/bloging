require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
	def setup 
		Capybara.app_host = 'http://localhost:3000'
		Capybara.default_wait_time = 15
		Capybara.current_driver = :selenium
	end
	
	test "should submit a new blog entry" do
		visit(new_blog_entry_path)
		fill_in("Title", :with => "This is the title")
		click_on("Create")
		assert page.has_content?('created.')
	end
end
