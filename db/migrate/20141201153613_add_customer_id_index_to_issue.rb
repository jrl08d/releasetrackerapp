class AddCustomerIdIndexToIssue < ActiveRecord::Migration
  def change
  	add_index :issues, :customer_id
  end
end
