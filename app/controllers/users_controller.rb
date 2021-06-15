class UsersController < ApplicationController

before_action :correct_user,only: [:edit, :update]

  def top
  end

  def about
  end


  def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = Book.where(user_id:@user.id)


  end

  def index
  @users = User.all
  @user = current_user
  @book = Book.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     @user = current_user
   if @user.update(user_params)
      flash[:notice] = "You have update user successfully."
     redirect_to user_path(@user.id)
   else
     render :edit
   end
  end





 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
        @user = User.find(params[:id])
    unless
        @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
