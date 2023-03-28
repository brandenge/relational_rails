class AuthorsController < ApplicationController
  def index
    @authors = Author.sorted
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

  end

  private

  def author_params
    params.permit(:name, :birthdate, :is_alive, :citation_count)
  end
end
