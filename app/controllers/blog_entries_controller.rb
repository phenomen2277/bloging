class BlogEntriesController < ApplicationController
	def index
		@blog_entries = BlogEntry.all
	end

	def new
		@blog_entry = BlogEntry.new
	end
end