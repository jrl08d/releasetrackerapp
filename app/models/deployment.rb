class Deployment < ActiveRecord::Base
	belongs_to :customer
	belongs_to :release
	accepts_nested_attributes_for :customer
	accepts_nested_attributes_for :release


	def self.most_recent
		first(:order => 'id DESC') # or whatever query you need to get the most recent
	end
end
