# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if Rails.env != 'production'
  Release.destroy_all
  Deployment.destroy_all
  Customer.destroy_all

  customer_count = 20
  release_count = 30

  # Populate Customers
  customer_count.times do
    FactoryGirl.create :customer
  end

  # Populate Releases --> issues with running this when uniqueness validation is enforced
  release_count.times do |i|
    FactoryGirl.create :release, version: "#{i + 1}.0.0"
  end

  (customer_count * 3).times do
    FactoryGirl.create :deployment
  end
end
