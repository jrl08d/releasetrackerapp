require 'rails_helper'

describe "Ability" do

  context "as admin" do
    it "can manage all" do
      admin = create(:admin)
      ability = Ability.new(admin)
      ability.can?(:manage, :all).should be true
    end
  end

  context "as customer" do
    let!(:customer) { create(:customer) }
    let!(:ability)  { Ability.new(customer.user) }

    it "cannot manage anything" do
      ability.can?(:manage, :all).should be false
      ability.can?(:manage, Deployment).should be false
      ability.can?(:manage, Customer).should be false
      ability.can?(:manage, Release).should be false
    end

    it "can read own deployment and release but not manage them" do
      deployment = create(:deployment, customer: customer)
      release = deployment.release
      deployment.customer.user.should == customer.user

      ability.can?(:read, deployment).should be true
      ability.can?(:manage, deployment).should be false

      ability.can?(:read, release).should be true
      ability.can?(:manage, release).should be false
    end

    it "cannot read other customer deployment" do
      deployment = create(:deployment) # creates random customer and release
      deployment.customer.user.should_not == customer.user
      ability.can?(:read, deployment).should be false
    end

    it "cannot read other customers or releases" do
      ability.can?(:read, create(:customer)).should be false
      ability.can?(:read, create(:release)).should be false
    end
  end

end
