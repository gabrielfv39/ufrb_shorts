json.extract! video, :id, :title, :synopsis, :youtube_url, :duration, :cast, :crew, :category, :user_id, :created_at, :updated_at
json.url video_url(video, format: :json)
