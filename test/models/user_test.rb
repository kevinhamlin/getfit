require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "unique@email.com", password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  # test "the truth" do
  #   assert true
  # end

  test "should not save user without email" do
    user = User.new
    assert_not user.save
  end

  test "should have default value of UTC for time_zone" do
    @user.save
    assert_equal "UTC", @user.reload.time_zone 
  end
end
