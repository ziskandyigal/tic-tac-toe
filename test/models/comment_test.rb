require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "create comment with text, succeed" do
    comment = Comment.new(text: comments(:one).text)

    assert_equal comment.text, comments(:one).text
  end

  test "comment time should be defined" do
    comment = Comment.new(text: "test")

    assert_not_nil comment.time
  end
end
