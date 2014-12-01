class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.references :user, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
