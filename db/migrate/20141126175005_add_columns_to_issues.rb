class AddColumnsToIssues < ActiveRecord::Migration
  def change
  	add_column :issues, :description, :text
  	add_column :issues, :reported_date, :date
  	add_column :issues, :software_version, :string
  	add_column :issues, :reporter_name, :string
  	add_column :issues, :severity, :string
  	add_column :issues, :github_issue_number_reference, :integer
  end
end
