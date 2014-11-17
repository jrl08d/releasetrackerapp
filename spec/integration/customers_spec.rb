require 'rails_helper'

RSpec.describe "Customer lookup" do

  it "should display a list of customers" do
    visit '/customers'
  end

end
