class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:destroy]
    before_action :check_owner, only: [:destroy]

    # POST /users
    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # DELETE /users/1
    def destroy
        @user.destroy
        head 204
    end

    private

    # whitelist params
    def user_params
        params.require(:user).permit(:email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def check_owner
        head :forbidden unless @user.id == current_user&.id
    end
end
