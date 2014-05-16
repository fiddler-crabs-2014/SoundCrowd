class PlaylistsController < ApplicationController

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to playlists_path
    else
      render :new, :notice => "Please enter a valid Playlist Name"
    end
  end

  def index
    @playlists = Playlist.all
  end

  def show 
    @playlist = Playlist.find(params[:id])
  end

  def edit 
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update_attributes(params[:name])
      redirect_to playlists_path
    else
      render :edit, :notice => "Please enter"
    end
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name)
    end

end
