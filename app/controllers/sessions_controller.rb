class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user
            session[:user_id] = user.id
            render json: user, status: :accepted
        else
            render json: {error: "User was not authenticated", status: :unprocessable_entity}
        end
    end

    def destroy
        session.clear
        render json: {message: "User successfully logged out"}, status: :ok
    end
end
