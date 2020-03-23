class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
  	 if @user.update(user_params)
  	 	flash[:notice] = "You have updated user successfully."
  	    redirect_to user_path(@user.id)
     else
      render action: :edit
     end
  end
  def index
  	@users = User.all
  	@user = current_user
    @book = Book.new
  end

  def create
  params.require(:user).permit(:postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end


  def follow_list
    @user = User.find(params[:user_id])
  end

  def follower_list
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email)
  end
end

#確認用http
#http://localhost:3000/