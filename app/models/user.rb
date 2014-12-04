class User < ActiveRecord::Base
	has_many :operators
	has_many :comments, through: :issues
	has_many :customers, :through => :operators
	has_many :deployments, through: :customers
	acts_as_authentic
end
