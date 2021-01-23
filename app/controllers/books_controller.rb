class BooksController < ApplicationController
  before_action :authenticate_user!
  # def new
  #   @book = Book.new
  # end
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
		@users = User.all
  end

  def show
    # @books = Book.all
    @book = Book.new
		@bookdetail = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
			redirect_to books_path
end
  end
  
  
  def create
    @book = Book.new(book_params)
    # binding.pry
    # @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have creatad book successfully."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end




  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated user successfully."
    # @book.update(book_params)
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end



  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private

def book_params
  params.require(:book).permit(:title, :body)
end

end
