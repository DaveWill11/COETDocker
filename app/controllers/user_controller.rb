class UserController < ApplicationController
    skip_forgery_protection
    def show  
        respond_to do |format|
            if session[:user]
                format.json { render json: {user: session[:user]}, status: 200 } 
            else 
            format.json { render json: { error: "No user found" }, status: 404 }
            end
        end
    end

    def login
        @user = User.new(user_params)
        session[:user] = @user.username
        
        if @user.save
            head :no_content
        else
            respond_to do |format|
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
      end
    def user_params
        params.permit(:id, :username, :password)
    end

end