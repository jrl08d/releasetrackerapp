class CSVExportJob
  @queue= :default

  @queue = :default
  def self.perform
    File.open("tmp/test_export.csv", "wb") do |f|
      f << Customer.to_csv
      f.close
    end
  end
end
