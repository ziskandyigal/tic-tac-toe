class Api::V1::GamesController < ApplicationController
    before_action :check_login, only: %i[create]

    def index
        render json: Game.all
    end
    
    def show
        render json: Game.find(params[:id])
    end

    def create
        user_game = current_user.games.build(game_params)
        
        if user_game.save
            render json: user_game, status: :created
        else
            render json: {
                errors: user_game.errors,
            },
            status: :unprocessable_entity
        end
    end

    def wins
        render json: Game.win.group(:user_id).count
    end

    private
    
    def game_params
        params.require(:game).permit(:status)
    end
end
