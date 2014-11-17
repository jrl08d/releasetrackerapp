class Customer < ActiveRecord::Base
	has_many :deployments
	has_many :releases, through: :deployments
	accepts_nested_attributes_for :deployments
	accepts_nested_attributes_for :releases
	validates :name, :presence => true, :uniqueness => true


	def self.to_csv
		CSV.generate do |csv|
			csv << ["Customer Name", "Deployment History", "Release/Version History"]
			all.each do |customer|
				csv << [
				customer.name, customer.deployments.collect { |a| a.deploy_date },
				customer.releases.collect { |a| a.version }
			]
			end
		end
	end
end


