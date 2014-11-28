class AddCustomerIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :customer_id, :integer
  end
end
