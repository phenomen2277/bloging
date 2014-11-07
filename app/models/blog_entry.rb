class BlogEntry < ActiveRecord::Base
	validates :title, :presence => true
	validates :body, :presence => true
end
