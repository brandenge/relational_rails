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

  private

  def author_params
    params[:birthdate] = params[:birthdate].last(4) + '-' + params[:birthdate][0..1] + '-' + params[:birthdate][2..3]
    params[:citation_count] = params[:citation_count].to_i
    params[:is_alive] = params[:is_alive] == '1' ? true : false
    params.permit(:name, :birthdate, :is_alive, :citation_count)
  end
end
