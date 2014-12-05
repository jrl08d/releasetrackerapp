class Issue < ActiveRecord::Base
	include ActiveModel::Validations
	belongs_to :customer
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates_presence_of :description, :reported_date, :software_version, :severity, :status, :title
end
