class VideoService
  def self.call(spot_id, keyword:)
    youtube_service = YoutubeService.new(api_key: ENV['GOOGLE_YOUTUBE_API_KEY'])
    videos_data = youtube_service.search_videos(keyword)

    videos_data.items.each do |video_data|
      Video.create(
        spot_id: spot_id,
        youtube_video_id: video_data.id.video_id,
        thumbnail_url: video_data.snippet.thumbnails.high.url
      )
    end
  rescue Google::Apis::Error => e
  end
end