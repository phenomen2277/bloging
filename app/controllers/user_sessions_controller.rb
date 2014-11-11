class UserSessionsController < ApplicationController
  def logout
  	session.delete(:logged_in) if session[:logged_in] != nil
  	redirect_to blog_entries_path
  end
end
