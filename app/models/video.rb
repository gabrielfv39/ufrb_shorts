class Video < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy
  has_many :comments, dependent: :destroy	

def youtube_thumbnail
  if youtube_url.present?
    youtube_id = extract_youtube_id(youtube_url)
    "https://img.youtube.com/vi/#{youtube_id}/hqdefault.jpg"
  end
end

def extract_youtube_id(url)
  regex = %r{(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})}
  match = regex.match(url)
  match[1] if match
end
  
  def likes_count
    reactions.where(reaction_type: 'like').count
  end
  
  def dislikes_count
    reactions.where(reaction_type: 'dislike').count
  end
end

private
  
def clean_lists
  self.cast = cast.split(',').map(&:strip).reject(&:empty?).join(', ') if cast.present?
  self.crew = crew.split(',').map(&:strip).reject(&:empty?).join(', ') if crew.present?
end