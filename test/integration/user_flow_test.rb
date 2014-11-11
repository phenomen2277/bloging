require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
	def setup 
		Capybara.app_host = 'http://localhost:3000'
		Capybara.default_wait_time = 15
		Capybara.current_driver = :selenium
	end

end
