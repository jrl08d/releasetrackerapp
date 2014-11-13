class Release < ActiveRecord::Base
	has_many :deployments
	has_many :customers, through: :deployments
	accepts_nested_attributes_for :deployments
	accepts_nested_attributes_for :customers
	validates_presence_of :version
end
