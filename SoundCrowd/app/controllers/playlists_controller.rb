class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
    @user = User.find(params[:user_id])
    @playlist = @user.playlists.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      #corrected nested path name
      #playlists_paths to user_playlists_path
      redirect_to user_playlists_path
    else
      render :new, :notice => "Please enter a valid Playlist Name"
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update_attributes(playlist_params)
      #corrected nested path name
      #playlists_paths to user_playlists_path
      redirect_to user_playlists_path
    else
      render :edit, :notice => "Please enter"
    end
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name)
    end

end
