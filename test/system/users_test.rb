require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  # test "visiting the index" do
  #   visit users_url
  #
  #   assert_selector "h1", text: "Users"
  # end
  def setup
    @user = users(:confirmed_user)
  end

  test "should register" do
    visit new_user_registration_path
    
    assert_difference("User.count") do

      fill_in "Email Address", with: "unique@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm Password", with: "password"

      click_button "Sign up"
    end
  end

  test "should sign in" do
    visit new_user_session_path

    fill_in "Email Address", with: @user.email
    fill_in "Password", with: "password"
    click_button "Log in"

    assert_selector "p", text: "Signed in successfully."
  end

  test "should update time zone" do
    sign_in @user

    visit edit_user_registration_path

    select "Eastern Time (US & Canada)"

    fill_in "Current Password", with: "password"

    click_button "Save Changes"

    assert_equal "Eastern Time (US & Canada)", @user.reload.time_zone.name
  end

end
