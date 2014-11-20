class User < ActiveRecord::Base
	has_one :customer
	has_many :deployments, through: :customers
	acts_as_authentic
end
