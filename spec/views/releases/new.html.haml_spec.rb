require 'rails_helper'

RSpec.describe "releases/new", :type => :view do
  before(:each) do
    assign(:release, Release.new(
      :version => 1,
      :comments => "MyText"
    ))
  end

  it "renders new release form" do
    render

    assert_select "form[action=?][method=?]", releases_path, "post" do

      assert_select "input#release_version[name=?]", "release[version]"

      assert_select "textarea#release_comments[name=?]", "release[comments]"
    end
  end
end
