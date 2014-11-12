class AddCustomerIdToDeployments < ActiveRecord::Migration
  def change
    add_column :deployments, :customer_id, :integer
  end
end
