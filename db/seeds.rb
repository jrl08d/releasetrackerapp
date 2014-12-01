unless Rails.env.production?



  if Rails.env != 'production'

    Release.destroy_all
    Deployment.destroy_all
    Customer.destroy_all
    User.destroy_all
    Issue.destroy_all

    customer_count = 20
    release_count = 30

    # Populate Customers
    customer_count.times do
      FactoryGirl.create :customer
    end

    # Populate Releases
    release_count.times do |i|
      FactoryGirl.create :release, version: "#{i + 1}.0.0"
    end

    # Populate Deployments
    (customer_count * 3).times do
      FactoryGirl.create :deployment_for_existing_data
    end

    # Seed Admin
    FactoryGirl.create :admin, username: 'admin', password: 'admin'

    10.times do 
      FactoryGirl.create :issue
    end
  end

end
