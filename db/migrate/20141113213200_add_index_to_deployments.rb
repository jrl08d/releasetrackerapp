class AddIndexToDeployments < ActiveRecord::Migration
  def change
  	add_index :deployments, :customer_id
  	add_index :deployments, :version_id
  end
end
