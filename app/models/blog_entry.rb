class BlogEntry < ActiveRecord::Base
	acts_as_taggable
	validates :title, :presence => true
	validates :body, :presence => true
	validates :tag_list, :presence => true
	before_validation :check_tags

	protected
	def check_tags 
		self.tag_list.add("Unspecified") if self.tag_list.empty?
	end
end
