class BlogEntry < ActiveRecord::Base
	acts_as_taggable
	validates :title, :presence => true
	validates :body, :presence => true
	validates :tag_list, :presence => true
end
