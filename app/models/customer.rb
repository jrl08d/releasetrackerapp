class Customer < ActiveRecord::Base
	has_many :deployments
	has_many :releases, through: :deployments
	accepts_nested_attributes_for :deployments
	accepts_nested_attributes_for :releases
end
