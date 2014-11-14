FactoryGirl.define do
  factory :customer do
    name { Faker::Company.name }
    factory :customer_with_deployment do
    	after(:create) do |customer|
    		create(:deployment, customer: customer)
    	end
    end
  end
  factory :deployment do
  	deploy_date { Faker::Date.between(2.years.ago, Date.today)}
  	customer { Customer.first }
  	release { Release.first}
  end

  factory :release do
  	version {"#{rand(1..10)}.#{rand(1..20)}.#{rand(1..30)}"}
  	comments {Faker::Lorem.sentence}
  end
end