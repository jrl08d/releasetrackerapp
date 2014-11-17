class CSVExportJob
	@queue= :default

  @queue = :default
	def self.perform
		Customer.to_csv
	end
end