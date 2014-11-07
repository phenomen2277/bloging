class BlogEntry < ActiveRecord::Base
	validates :title, :presence => true
end
