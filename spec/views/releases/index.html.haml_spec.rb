require 'rails_helper'

RSpec.describe "releases/index", :type => :view do
  before(:each) do
    assign(:releases, [
      Release.create!(
        :version => 1,
        :comments => "MyText"
      ),
      Release.create!(
        :version => 1,
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of releases" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
