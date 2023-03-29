class AuthorsController < ApplicationController
  def index
    @authors =
    case
    when params[:book_count]
      @sort_by_book_count = params[:book_count]
      Author.sort_by_book_count
    when params[:exact_match_name]
      Author.exact_match_name(params[:exact_match_name])
    when params[:search_name]
      Author.search_name(params[:search_name])
    else
      Author.sort_by_created_at
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def new

  end

  def create
    Author.create(author_params)
    redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(author_params)
    redirect_to "/authors/#{author.id}"
  end

  def destroy
    author = Author.find(params[:id])
    author.books.destroy_all
    author.destroy
    redirect_to '/authors'
  end

  private

  def author_params
    params.permit(:name, :birthdate, :is_alive, :citation_count)
  end
end
