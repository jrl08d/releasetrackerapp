class User < ActiveRecord::Base
	has_many :operators
	has_many :customers, :through => :operators
	has_many :deployments, through: :customer
	acts_as_authentic
end
