class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(strong_param)
    @song.save
    redirect_to song_path(@song)
  end

  def update
    @song = Song.find(params[:id])
    @song.update(strong_param)
    redirect_to song_path(@song)
  end

  private

  def strong_param
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
