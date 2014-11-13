class AddNameIndexToCustomers < ActiveRecord::Migration
  def change
  	add_index :customers, :name
  end
end
