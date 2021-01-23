class UsersController < ApplicationController
before_action :authenticate_user!

  # def new
  #   @book = Book.find(params[:book_id])
  # end
  
  def index
    @user = current_user
    @book = Book.new
    # @book =Book.new
    @users = User.all
  end

  def show
    # @users = User.all
    # @user = User.new
    @user = User.find(params[:id])
    # @book = Book.find(params[:id])
    # @user.user_id = current_user.id
    # 現在の使用者
    @books = @user.books.all
		@book = Book.new
  end

  def edit
    
    # @book = Book.find(params[:id])
    @user = User.find(params[:id])
    if @user.id != current_user.id
			redirect_to user_path(@current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "User was successfully updated."
			redirect_to user_path(@user.id)
		else
			render :action => "edit"
		end
    # book = Book.find(params[:id])
    # book.update(book_params)
    # redirect_to book_path(book.id)
    
  end

end
