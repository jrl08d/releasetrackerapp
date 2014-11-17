require 'rails_helper'

RSpec.describe "Deployments lookup" do

  before(:each) do
    @deployments_count = 5

    @deployments_count.times do
      FactoryGirl.create :customer
      FactoryGirl.create :release
      FactoryGirl.create :deployment
    end

    Deployment.count.should == @deployments_count
  end

  it "should allow filtering of customers", focus: true do
    visit '/deployments'

    page.should have_selector('table tr', count: @deployments_count)

    select Customer.last.name, from: :customer_id
    click_on 'Filter'

    page.should have_selector('table tr', :count => 1)
  end

end
