class User < ActiveRecord::Base
	has_one :customer
	has_many :deployments, through: :customer
	acts_as_authentic
end
