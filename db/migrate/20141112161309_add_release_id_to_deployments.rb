class AddReleaseIdToDeployments < ActiveRecord::Migration
  def change
    add_column :deployments, :release_id, :integer
  end
end
