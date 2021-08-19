require "test_helper"

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @user = users(:one)
  end

  test "should show all comments for specific game" do
    get api_v1_comments_byemail_url(@user.email), as: :json
    
    assert_response :success
  end

  test "should create new comment" do
    # assert_difference('Comment.count') do
      post api_v1_comments_url, params: {
        comment: {
          text: "test"
        },
        email: @user.email,
      }, as: :json
    # end

    assert_response :created
    json_response = JSON.parse(self.response.body)
    assert_equal "test", json_response["text"]
  end
end
