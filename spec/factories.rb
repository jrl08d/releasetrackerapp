FactoryGirl.define do


  factory :user do
    username  { "#{Faker::Internet.user_name}_#{rand(1..9999)}" }
    email     { Faker::Internet.email }
    password  { "user" }
    password_confirmation { password }

    factory :admin do
      admin true
    end
  end

  factory :customer do
    name { Faker::Company.name }
    # TODO: create an associated user/operator
  end

  factory :release do
    before(:create) do |release|
      unless release.version
        unique_version = false
        begin
          release.version = "#{rand(1..10)}.#{rand(0..20)}.#{rand(0..30)}"
          unique_version = ! Release.exists?(version: release.version)
        end until unique_version
      end
    end
    comments { Faker::Lorem.paragraph }
    release_date { Faker::Date.between(2.years.ago, Date.today) }
  end

  factory :deployment do
    deploy_date { Faker::Date.between(2.years.ago, Date.today) }
    customer    { create(:customer) }
    release     { create(:release) }
  end

  factory :deployment_for_existing_data, class: Deployment do
    before(:create) do |deployment|
      unique_deployment = false
      begin
        deployment.customer = Customer.without_deployment.random || Customer.random
        deployment.release = Release.random
        unique_deployment = ! Deployment.exists?(customer: deployment.customer, release: deployment.release)
      end until unique_deployment
    end

    deploy_date { Faker::Date.between(2.years.ago, Date.today) }
  end

  factory :issue do
    title {Faker::Lorem.sentence}
    description {Faker::Lorem.paragraph}
    reported_date {Faker::Date.between(5.months.ago, Date.today)}
    software_version { create(:release) }
    reporter_name {Faker::Name.name}
    severity "low"
    status "new"
    customer
  end

end
