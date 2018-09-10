class PostBooksController < ApplicationController

    before_action :authenticate_user!, except: [:index]

	def new
        @user = current_user
        @users = User.all
		@post_book = PostBook.new
        @post_books = PostBook.all
    end

def create
    @post_book = PostBook.new(post_book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
    redirect_to post_book_path(@post_book.id)
    else
        redirect_to :action => "new"
    end
end

    def edit
        @post_book = PostBook.find(params[:id])
    end

    def index 
    end

    def show
        @user = current_user
        @post_book = PostBook.find(params[:id])
        @post_books = @user.post_books.page(params[:page]).reverse_order
    end

    def destroy
        @post_book = PostBook.find(params[:id])
        @post_book.destroy
        redirect_to :action => "new"
    end

    def update
        @post_book = PostBook.find(params[:id])
        @post_book.update(post_book_params)
        redirect_to post_book_path(@post_book.id)
    end

    private
    def post_book_params
        params.require(:post_book).permit(:title, :opinion, :profile_image)
    end
      def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
