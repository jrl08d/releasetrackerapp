class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.integer :version
      t.text :comments

      t.timestamps
    end
  end
end
