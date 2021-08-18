require "test_helper"

class Api::V1::GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should show game" do
    get api_v1_game_url(@game), as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @game.status, json_response['status']
    assert_not_nil json_response['time']
  end

  test "should show games" do
    get api_v1_games_url(), as: :json
    assert_response :success
  end

  test "should show games filtered by win status" do
    get api_v1_games_wins_path(), as: :json
    assert_response :success
  end

  test "should create game, suceed" do
    assert_difference('Game.count') do
      post api_v1_games_url,
        params: {
          game: {
            status: @game.status
          }
        },
        headers: {
          Authorization: JsonWebToken.encode(user_id: @game.user_id)
        }, 
        as: :json
    end

    assert_response :created
    json_response = JSON.parse(self.response.body)
    assert_equal @game.status, json_response['status']
  end
  
  test "should create game, forbidden" do
    assert_no_difference('Game.count') do
      post api_v1_games_url,
        params: {
          game: {
            status: "win"
          }
        },
        as: :json
    end

    assert_response :forbidden
  end
end
