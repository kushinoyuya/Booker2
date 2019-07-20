class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @user = User.find(current_user.id)
    @users = User.all
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      render :index
     end
   end

  def index
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    # @user = User.find(current_user.id)
    @user = @book.user
    @book_new = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  def edit
    @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
   else
     render :edit
  end
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  if @user != current_user
     redirect_to books_path
  end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
