require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
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
end
