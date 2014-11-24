require 'rails_helper'

RSpec.describe "Customer lookup" do

  before(:each) do
    @customers_count = 10

    @customers_count.times do
      create :customer
    end

    Customer.count.should == @customers_count

    @user = create(:admin)

    sign_in @user
  end

  it "should display a list of customers" do
    visit '/customers'
    page.should have_text("Name")
  end


  it "should update cache whenever customer records change" do
    visit '/customers'
    page.should have_selector('table tbody tr', count: @customers_count)
    create :customer

    Customer.count.should == (new_count = @customers_count + 1)

    visit '/customers'
    page.should have_selector('table tbody tr', count: new_count)
  end
  #testing i18n translations
  describe "GET 'index'" do
    before do
      get 'index'
    end
    it "should be successful" do
      response.should be_redirect
    end
  end


end
