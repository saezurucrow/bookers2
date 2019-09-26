class UsersController < ApplicationController

	before_action :authenticate_user!, except: [:new]

  def index
  	@book = Book.new
  	@user= current_user
    @users = User.all
  end

  def show
  	@user= current_user
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
  end

  def edit
  	@book = Book.new
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	 redirect_to user_path(@user.id)
    else
      redner :index
    end
  end

  def new
  end

  private
  def user_params
  	params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
