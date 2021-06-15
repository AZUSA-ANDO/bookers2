class BooksController < ApplicationController
  before_action :ensure_correct_user, only:[:edit]

def index
  @book = Book.new
  @books = Book.all
  @user = current_user

end

def create
@book = Book.new(book_params)
@book.user_id = current_user.id

    if
      @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @user = @book.user
      @books = Book.all
      render :index
    end

end

def show
  @book = Book.find(params[:id])
  @book_new = Book.new
  @books = Book.all
  @user = @book.user

end

def edit
   @book = Book.find(params[:id])

end

def update
   @book = Book.find(params[:id])
   @book.user_id = current_user.id
    if
      @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)

    else

      render :edit
    end
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path

end



def ensure_correct_user
    @book = Book.find(params[:id])
     unless @book.user == current_user
     redirect_to books_path
     end
end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
