class Deployment < ActiveRecord::Base
	belongs_to :customer
	belongs_to :release
	accepts_nested_attributes_for :customer
	accepts_nested_attributes_for :release
end
