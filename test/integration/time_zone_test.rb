require "test_helper"

class TimeZoneTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:confirmed_user_with_time_zone)
  end

  test "should set applicatioin time_zone to equal user.time_zone" do
    sign_in @user

    get root_path
    assert_equal 'Eastern Time (US & Canada)', Time.zone.name
  end
end
