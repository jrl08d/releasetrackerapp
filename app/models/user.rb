class User < ActiveRecord::Base
	has_many :customers
	has_many :deployments, through: :customers
	acts_as_authentic
end
