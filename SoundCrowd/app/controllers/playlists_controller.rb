class PlaylistsController < ApplicationController
  before_action :signed_in_user, except: [:index, :show]
  def index
    @user = User.find(params[:user_id])
    @playlists = @user.playlists
  end

  def new
    @playlist = current_user.playlists.new
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)
    if @playlist.save
      #corrected nested path name
      #playlists_paths to user_playlists_path
      redirect_to user_playlists_path
    else
      render :new, :notice => "Please enter a valid Playlist Name"
    end
  end

  def show
    @client = SoundCloud.new(:client_id => ENV['CLIENT_ID'])
    @playlist = Playlist.find(params[:id])
    @songs = @playlist.songs
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


  def destroy
    @user = User.find(params[:user_id])
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to user_playlists_path(@user.id)
  end


  private

    def playlist_params
      params.require(:playlist).permit(:name)
    end

end
