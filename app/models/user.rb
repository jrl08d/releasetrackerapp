class User < ActiveRecord::Base
	include ActiveModel::Validations
	has_many :operators
	has_many :comments, through: :issues
	has_many :customers, :through => :operators
	has_many :deployments, through: :customers
	acts_as_authentic
	validates_presence_of :username, :email, :password, :password_confirmation
end
