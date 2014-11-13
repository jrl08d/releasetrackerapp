class AddVersionIndexToReleases < ActiveRecord::Migration
  def change
  	add_index :releases, :version
  end
end
