class Issue < ActiveRecord::Base
	belongs_to :customer
	has_many :comments, dependent: :destroy
	validates_presence_of :description, :reported_date, :software_version, :reporter_name, :severity, :status, :title
end
