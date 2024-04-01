class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :youtube_video_id
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
