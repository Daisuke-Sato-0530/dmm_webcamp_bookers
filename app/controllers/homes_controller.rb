class HomesController < ApplicationController

  def top
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to show_room_path(book.id), notice: "successfully"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.all
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to show_room_path(book.id,), notice: "successfully"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "successfully"
  end




private
  def book_params
    params.require(:book).permit(:title,:body) #require(テーブル名)
  end

end