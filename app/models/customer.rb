class Customer < ActiveRecord::Base
	has_many :deployments
	has_many :releases, through: :deployments
end
