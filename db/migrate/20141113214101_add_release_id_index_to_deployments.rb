class AddReleaseIdIndexToDeployments < ActiveRecord::Migration
  def change
  	add_index :deployments, :release_id
  end
end
