class Author::BooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books =
    case
    when params[:sort_by]
      @author.books.order(params[:sort_by])
    when params[:page_count_filter]
      @author.books.where("page_count > #{params[:page_count_filter]}")
    when params[:exact_match_title]
      @author.books.where(title: params[:exact_match_title])
    when params[:search_title]
      @author.books.where("LOWER(title) LIKE '%#{params[:search_title]}%'")
    else
      @author.books
    end
  end

  def new
    @author = Author.find(params[:author_id])
  end

  def create
    author = Author.find(params[:author_id])
    author.books.create(book_params)
    redirect_to "/authors/#{params[:author_id]}/books"
  end

  private

  def book_params
    params.permit(:title, :subtitle, :publisher, :publication_date, :is_in_print, :page_count)
  end
end
