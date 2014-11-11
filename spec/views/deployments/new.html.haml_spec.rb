require 'rails_helper'

RSpec.describe "deployments/new", :type => :view do
  before(:each) do
    assign(:deployment, Deployment.new())
  end

  it "renders new deployment form" do
    render

    assert_select "form[action=?][method=?]", deployments_path, "post" do
    end
  end
end
