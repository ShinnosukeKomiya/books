class BooksController < ApplicationController
#  before_action :logged_in_book, only: [:index, :edit, :update]
#  before_action :correct_book,   only: [:edit, :update]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "your book inserted!"
      redirect_to action: 'index'
    else
      redirect_to action: 'index'
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
      flash[:success] = "book updated"
      redirect_to action: 'index'
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @books = Book.search(params[:search])
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "book deleted"
    redirect_to action: 'index'
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :publisher,
                                   :genre)
    end

end
