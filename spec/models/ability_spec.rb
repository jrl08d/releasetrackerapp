require 'rails_helper'

describe "Ability" do
  context "as admin" do
    it "can access all" do
      user=FactoryGirl.create(:user)
      ability = Ability.new(user)
      ability.can?(:manage, :all).should == true
    end
  end
end
