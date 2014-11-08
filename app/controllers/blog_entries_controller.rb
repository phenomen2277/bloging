class BlogEntriesController < ApplicationController

	def index
		@blog_entries = BlogEntry.all
	end
end