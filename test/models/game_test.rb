require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "game should be initialized with params" do
    game = Game.new(status: :win)

    assert_equal game.status, "win"
  end

  test "game default status should be :draw" do
    game = Game.new()

    assert_equal game.status, "draw"
  end

  test "game time should be defined" do
    game = Game.new(status: :win)

    assert_not_nil game.time
  end
end

