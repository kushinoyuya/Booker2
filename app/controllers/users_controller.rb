class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
    @user= current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def destroy
    @user = User.find(params[:id])
    @books = @user.books
    @user.destroy
    redirect_to books_path
  end

  def edit
      @user = User.find_by(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
