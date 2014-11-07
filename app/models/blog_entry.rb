class BlogEntry < ActiveRecord::Base
	acts_as_taggable
	validates :title, :presence => true
	validates :body, :presence => true
	validates :tag_list, :presence => true
	before_validation :check_tags

	private
	def check_tags 
		if self.tag_list.empty?
		self.tag_list.add("Unspecified")
		end
	end
end
