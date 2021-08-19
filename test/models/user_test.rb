require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user with valid email should succeed" do
    user = User.new(email: "test@t.com", password_digest: "123123")
    assert user.valid?
  end

  test "new user with exisitng email shuld fails" do
    existing_user = users(:one)
    user = User.new(email: existing_user.email, password_digest: "123123")
    assert_not user.valid?
  end

  test "destroy user has to destroy user's acciciated games" do
    assert_difference('Game.count', -1) do
      users(:one).destroy
    end
  end

  test "destroy user has to destroy user's acciciated comments" do
    assert_difference('Comment.count', -1) do
      users(:one).destroy
    end
  end
end
