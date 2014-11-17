require 'rails_helper'

RSpec.describe "Customer lookup" do

  before(:each) do
    10.times do
      FactoryGirl.create :customer
    end

    Customer.count.should == 10
  end

  it "should display a list of customers" do
    visit '/customers'
  end

end
