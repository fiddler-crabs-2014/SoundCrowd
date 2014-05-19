module SongHelper
  def sound_cloud_player_url(song)
    url = "https://player.soundcloud.com/player.swf?"
    url << "url=#{song.url}&player_type=tiny{&color=ff6600&auto_play=false}"
  end
end
