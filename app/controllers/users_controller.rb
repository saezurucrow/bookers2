class UsersController < ApplicationController

	before_action :authenticate_user!, except: [:new]

  def index
  	@post_book = PostBook.new
  	@user= current_user
    @users = User.all
  end

  def show
  	@user= current_user
  	@post_book = PostBook.new
  	@user = User.find(params[:id])
  	@post_books = @user.post_books.page(params[:page]).reverse_order
  end

  def edit
  	@post_book = PostBook.new
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  def new
  end

  private
  def user_params
  	params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
