class VideoSearchService
  def self.call(keyword:)
    youtube_service = YoutubeService.new(api_key: ENV['GOOGLE_YOUTUBE_API_KEY'])
    @videos = youtube_service.search_videos(keyword)
  rescue Google::Apis::Error => e
  end
end