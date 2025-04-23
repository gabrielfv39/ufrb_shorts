module VideosHelper
  def youtube_id(youtube_url)
    uri = URI.parse(youtube_url)
    if uri.query
      params = URI.decode_www_form(uri.query).to_h
      params["v"]
    else
      youtube_url.split("/").last
    end
  rescue URI::InvalidURIError
    youtube_url
  end
  
  def embed_youtube_video(youtube_url)
    video_id = youtube_id(youtube_url)
    content_tag(:iframe, "", src: "https://www.youtube.com/embed/#{video_id}", 
                frameborder: 0, allowfullscreen: true, 
                width: 640, height: 360)
  end
end
