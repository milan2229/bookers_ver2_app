class UsersController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
  end
  
  def index
    @books = Book.all
    @book =Book.new
  end

  def show
    # @users = User.all
    # @user = User.new
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @user.user_id = current_user.id
    # 現在の使用者
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    # redirect_to book_path(@book.id)
  end

end
