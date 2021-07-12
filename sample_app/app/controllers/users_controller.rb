class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Registered user "+@user.name+" !"
            redirect_to @user
        else
            render 'new'
        end
    end

    def update
        @user = User.new(user_params)
        if @user.update(user_params)
            flash[:success] = "Updated user "+@user.name+" !"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
