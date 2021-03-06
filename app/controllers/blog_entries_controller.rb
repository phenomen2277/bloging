class BlogEntriesController < ApplicationController
	before_action :require_authentication, only: [:new, :edit, :update, :create, :destroy]
	before_action :set_blog_entry, only: [:show, :edit, :update, :destroy]
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

	def destroy
		respond_to do |format|
			if @blog_entry.destroy
				format.html { redirect_to blog_entries_url, notice: 'Blog entry was destroyed.' }
			else
				return head :forbidden
			end
		end
	end

	def update
		respond_to do |format|
			if @blog_entry.update(blog_entry_params)
				format.html { redirect_to @blog_entry, notice: 'Blog entry is updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def create
		@blog_entry = BlogEntry.new(blog_entry_params)

		respond_to do |format|
			if @blog_entry.save
				format.html { redirect_to :action => :index }
			else
				format.html { render :new, :status => :method_not_allowed }
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

	def require_authentication
		authenticate_or_request_with_http_basic do |name, password|
			if name == 'foo' && password == 'bar'
				session[:logged_in] = true
				return true
			else
				return false
			end
		end
	end

end