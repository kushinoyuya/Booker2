class BooksController < ApplicationController
  # before_action :authenticate_user!
  def top

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book)
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @user = User.find(current_user.id)
    @book_new = Book.new
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
      @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
