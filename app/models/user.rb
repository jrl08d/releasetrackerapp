class User < ActiveRecord::Base
	has_many :operators
	has_many :customers, through: :operator
	has_many :deployments, through: :customer
	acts_as_authentic
end
