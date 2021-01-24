class UsersController < ApplicationController
before_action :authenticate_user!

  

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
		@book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
			redirect_to user_path(@current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    # binding.pry
		if @user.update(user_params)
			flash[:success] = "You have updated user successfully."
			redirect_to user_path(@user.id)
		else
			render :action => "edit"
		end
    
  end

  private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end


end
