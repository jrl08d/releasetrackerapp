require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :username => "MyString",
      :email => "MyString",
      :crypted_password => "MyString",
      :password_salt => "MyString",
      :persistence_token => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_crypted_password[name=?]", "user[crypted_password]"

      assert_select "input#user_password_salt[name=?]", "user[password_salt]"

      assert_select "input#user_persistence_token[name=?]", "user[persistence_token]"
    end
  end
end
