require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  
  test "create user should succeed" do
    assert_difference('User.count') do
      post api_v1_users_url, params: {
        user: {
          email: 'test@t.com',
          password: '121212'
        }
      }, as: :json
    end

    assert_response :created
  end

  test "create user invalid email should fail" do
    assert_no_difference('User.count') do
      post api_v1_users_url, params: {
        user: {
          email: 't.com',
          password: '121212'
        }
      }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test "create user with invalid params should fail" do
    assert_no_difference('User.count') do
      post api_v1_users_url, params: {
        user: {
          email_xxx: 't.com',
          password_xxx: '121212'
        }
      }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test "delete user with jwt, succees" do
    assert_difference('User.count', -1) do
      delete api_v1_user_url(@user), headers: {
        Authorization: JsonWebToken.encode(user_id: @user.id)
      }, as: :json
    end

    assert_response :no_content
  end

  test "delete user without jwt, should fail" do
    assert_no_difference('User.count') do
      delete api_v1_user_url(@user), as: :json
    end

    assert_response :forbidden
  end

  test "should show user" do
    get api_v1_user_url(@user), as: :json

    assert_response :success
    json_response = JSON.parse(self.response.body)
    assert_equal @user.email, json_response["email"]
  end
end
