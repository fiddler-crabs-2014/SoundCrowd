class SoundCloudService
  def client
    @client ||= SoundCloud.new(client_id: ENV['CLIENT_ID']
  end

  def search_tracks(query)
    client.get('/tracks', q: query, limit: 10)
  end
end
