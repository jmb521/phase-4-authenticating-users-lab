class UsersController < ApplicationController

    def show
        binding.irb
        user = User.find(session[:user_id])
        if user
            render json: user, status: :ok
        else
            render json: {error: "User not authenticated"}, status: :unauthorized
        end
    end
end
