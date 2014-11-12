require 'rails_helper'

RSpec.describe "releases/edit", :type => :view do
  before(:each) do
    @release = assign(:release, Release.create!(
      :version => "9.99",
      :comments => "MyText"
    ))
  end

  it "renders the edit release form" do
    render

    assert_select "form[action=?][method=?]", release_path(@release), "post" do

      assert_select "input#release_version[name=?]", "release[version]"

      assert_select "textarea#release_comments[name=?]", "release[comments]"
    end
  end
end
