require 'rails_helper'

RSpec.describe "deployments/edit", :type => :view do
  before(:each) do
    @deployment = assign(:deployment, Deployment.create!())
  end

  it "renders the edit deployment form" do
    render

    assert_select "form[action=?][method=?]", deployment_path(@deployment), "post" do
    end
  end
end
