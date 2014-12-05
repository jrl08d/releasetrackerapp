class Release < ActiveRecord::Base
	include ActiveModel::Validations
	has_many :deployments
	has_many :customers, through: :deployments
	accepts_nested_attributes_for :deployments
	accepts_nested_attributes_for :customers
	validates :version, :presence => true, :uniqueness => true
	validates_presence_of :release_date

	def self.random
		order("RANDOM()").first
	end
	
end
