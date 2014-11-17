class CSVExportJob
	@queue = :default
	def self.perform
		Customer.to_csv
	end
end