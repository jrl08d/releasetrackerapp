class ChangeColumnTypeInReleases < ActiveRecord::Migration
  def change
    change_column :releases, :version, :string
  end
end