class AddIndexToDeployments < ActiveRecord::Migration
  def change
  	add_index :deployments, :customer_id
  end
end
