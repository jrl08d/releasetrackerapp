class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.date :deploy_date

      t.timestamps
    end
  end
end
