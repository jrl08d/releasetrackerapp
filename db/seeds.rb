# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require Rails.root.join('spec/factories.rb')

if Rails.env != 'production'

  # ...

  # Populate Customers
  20.times do
    FactoryGirl.create :customer
  end

  # ...


  # Populate Releases --> issues with running this when uniqueness validation is enforced 
  20.times do
    FactoryGirl.create :release
  end

  #5.times do
  #  FactoryGirl.create :deployment
  #end

end