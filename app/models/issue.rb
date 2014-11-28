class Issue < ActiveRecord::Base
	belongs_to :customer
	validates_presence_of :description, :reported_date, :software_version, :reporter_name, :severity, :status, :title
end
