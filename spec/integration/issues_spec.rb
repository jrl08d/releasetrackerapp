require 'rails_helper'

RSpec.describe "Issues lookup" do

  before(:each) do
    @issues_count = 5

    @issues_count.times do
      create :issue
    end

    Issue.count.should == @issues_count



    @user = create(:admin)
      sign_in @user
    end

    it "should show list of issues" do
      visit "/issues"
      page.should have_text("Issue")
    end


end
