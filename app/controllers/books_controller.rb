class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    flash[:notice] = 'Book was successfully edit.'
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
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path
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
end
