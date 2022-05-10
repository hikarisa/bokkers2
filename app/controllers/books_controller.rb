class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = @books.user
  end

  def update
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully edit.'
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = 'Book was successfully deleted.'
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end
end
