class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :operators
	has_many :issues
	has_many :deployments
	has_many :releases, through: :deployments
	accepts_nested_attributes_for :deployments
	accepts_nested_attributes_for :releases
	validates :name, :presence => true, :uniqueness => true

	def self.random
		order("RANDOM()").first
	end

	def self.without_deployment
		references(:deployments).includes(:deployments).where("deployments.id IS NULL") 
	end

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
	def self.search(search)
    	if search
      		#case insensitive
      		where(['LOWER(name) LIKE LOWER(?) ', "%#{search}%"])
    	else
      		where(nil)
    	end
  	end


end
