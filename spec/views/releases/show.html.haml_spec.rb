require 'rails_helper'

RSpec.describe "releases/show", :type => :view do
  before(:each) do
    @release = assign(:release, Release.create!(
      :version => 1,
      :comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
