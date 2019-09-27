class BooksController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to book_path(@book.id)
        else
            redirect_to :action => "new"
        end
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user_id != current_user.id
            redirect_to new_book_path
        end
    end

    def index
        @user = current_user
        @users = User.all
		@book = Book.new
        @books = Book.all
    end

    def show
        @user = current_user
        @new_book = Book.new
        @book = Book.find(params[:id])
        @books = @user.books.page(params[:page]).reverse_order
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to :action => "new"
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book.id)
        else
            redirect_to :action => "new"
        end
    end

    private
    def book_params
        params.require(:book).permit(:title,:body, :profile_image)
    end

    def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
    end

end
