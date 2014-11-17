class AddReleaseDateToRelease < ActiveRecord::Migration
  def change
    add_column :releases, :release_date, :date
    Release.find_each do |r|
    	r.release_date = Date.today
    	r.save!
    end
  end
end
