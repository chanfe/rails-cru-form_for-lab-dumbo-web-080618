class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(strong_param)
    @genre.save
    redirect_to genre_path(@genre)
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(strong_param)
    redirect_to genre_path(@genre)
  end

  private

  def strong_param
    params.require(:genre).permit(:name)
  end
end
