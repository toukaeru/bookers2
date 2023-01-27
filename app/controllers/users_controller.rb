class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
     flash[:notice] ="You have updated user successfully." 
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
