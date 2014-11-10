class BlogEntriesController < ApplicationController
	def index
		@blog_entries = BlogEntry.all
	end

	def new
		@blog_entry = BlogEntry.new
	end

	def create
		@blog_entry = BlogEntry.new(blog_entry_params)

		respond_to do |format|
      	if @blog_entry.save
        	format.html { redirect_to :action => :index }
      	else
        	format.html { render :new }
      	end
    end

	end

	private
	def blog_entry_params
      params.require(:blog_entry).permit(:title, :body, :tag_list)
    end
end