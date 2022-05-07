class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_parans)
    @book.user_id == current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end
  
  def update
    @book = book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render request.referer
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
    
end
