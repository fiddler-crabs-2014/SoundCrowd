class SongsController < ApplicationController

  def index
    # using enumerables vs using sql -- this is slow
    #@songs = Song.all.reverse.take(5)
    # select * from songs; - then you do stuff
    @songs = Song.order('created_at DESC').limit(5)
    # select * from songs order by created_at DESC, limit 5;
  end

  def new
    # signed_in? => use the method if you have it
    if current_user
      @playlist = Playlist.find(params[:format])
      @song = Song.new
    else
      redirect_to root_path
    end
  end
## using soundcloud

  def create
    # default stuff should happen in the model
    # add song method self.create_from_track
    #@track = params[:song][:track]
    #@title = params[:song][:title] || @track.title
    #@artist = params[:song][:artist] || @track.artist
    #@url = params[:song][:url]

    # name playlist_id
    @playlist = Playlist.find(params[:song][:playlist])
    #@song = @playlist.songs.build(:title => @title, :artist => @artist, :url => @url)

    track = params[:song][:track] #json
    #song_opts = { title: track.title, artist: track.artist}.merge(params[:song]) # might not work but ...
    # instead of getting all vals, just send create everything and add things
    # you want

    # probalby want to use strong params
    song_opts = song_params # start with strong parameters
    song_opts[:title] = track.title if song_opts[:title].empty?
    song_opts[:artist] = track.artist if song_opts[:title].empty?

    redirect_to "blahs" if @playlist.songs.create(song_opts) 

    if @song.save
      redirect_to user_playlist_path(current_user, @playlist)
    end
    # what happens if it errors?
  end

  def search
    @song = Song.new
    @playlist = Playlist.find(params[:playlist_id])
    search_text = params[:search]

    @search_results = sound_cloud.search_tracks(search_text) #search_soundcloud(search_text)
    render :results
  end

  def show
    @song = Song.find(params[:id])
  end


  private

  def song_params
    params.require(:song).permit(:title, :artist, :url)
  end

  def search_soundcloud(query)
    client = SoundCloud.new(:client_id => ENV['CLIENT_ID'])
    # should be in SoundCloud class - controller shouldn't know about how to
    # query soundcloud
    # models/concerns/SoundCloudService.rb => your code around sound cloud (or
    # put in lib)
    searched_tracks = client.get('/tracks', :q => query, limit: 10)
  end

end
