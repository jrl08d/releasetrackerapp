class Deployment < ActiveRecord::Base
	belongs_to :customer
	belongs_to :release

	accepts_nested_attributes_for :customer
	accepts_nested_attributes_for :release
  
	validates_presence_of :deploy_date
	validates :release_id,  presence:true, uniqueness:true


	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |deployment|
				csv << deployment.attributes.values_at(*column_names)
			end
		end
	end
end
