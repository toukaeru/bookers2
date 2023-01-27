class BooksController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def index
     @books = Book.all
     @book = Book.new
     @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.new
    @book_i = Book.find(params[:id])
    @user = @book_i.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

 def edit
   @book = Book.find(params[:id])
 end

 def update
    @book = Book.find(params[:id])
    @book.update(book_params)
   if @book.save
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
   else
    render :edit
   end
 end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end

   def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
   end
end
