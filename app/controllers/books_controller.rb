class BooksController < ApplicationController
  before_action :logged_in_user, only: [:show, :index, :edit, :update]
  before_action :admin_user,   only: [:edit, :update]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
      begin
        @book = Book.find(params[:id])
      rescue
        redirect_to action: 'index'
      end
      #@book = Book.find_by(params[:id])
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
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "book updated"
      redirect_to action: 'index'
    else
      render 'show'
    end
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

    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = Book.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
