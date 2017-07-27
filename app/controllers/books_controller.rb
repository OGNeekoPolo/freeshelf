class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]

  def index
    @books = Book.all.page params[:page]
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if session[:current_user_id] == @book.user_id
      if @book.update(book_params)
        redirect_to @book
      else
        render 'edit'
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if session[:current_user_id] == @book.user_id
      @book.destroy
      redirect_to books_path
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :URL)
    end
end
