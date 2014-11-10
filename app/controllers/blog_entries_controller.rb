class BlogEntriesController < ApplicationController
	before_action :set_blog_entry, only:[:show, :edit, :update]
	def index
		@blog_entries = BlogEntry.all.order("created_at DESC")
	end

	def new
		@blog_entry = BlogEntry.new
	end

	def show
	end

	def edit
	end

	def update

	end

	def create
		@blog_entry = BlogEntry.new(blog_entry_params)

		respond_to do |format|
			if @blog_entry.save
				format.html { redirect_to :action => :index }
			else
				return head :forbidden
			end
		end
	end

	private
	def blog_entry_params
		params.require(:blog_entry).permit(:title, :body, :tag_list)
	end

	def set_blog_entry
		return head :forbidden unless params[:id].to_i > 0
		@blog_entry = BlogEntry.find(params[:id])
	end
end