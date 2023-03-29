class BooksController < ApplicationController
  def index
    @books =
    case
    when params[:exact_match_title]
      Book.exact_match_title(params[:exact_match_title])
    when params[:search_title]
      Book.search_title(params[:search_title])
    else
      Book.in_print
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to "/books/#{book.id}"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.permit(:title, :subtitle, :publisher, :publication_date, :is_in_print, :page_count)
  end
end
