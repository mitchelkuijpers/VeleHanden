class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  #Comments
  include Commentable

  #Fields
  field :title, type: String
  field :story, type: String
  field :summary, type: String
  field :likes, type: Integer

  #Image
  field :photo_uid, type: String
  image_accessor :photo

  #Relations
  has_many :page_medias
  has_many :page_likes
  has_many :time_line_items
  belongs_to :wiki
  belongs_to :user

  # Increment the likes
  # @param page_id The id of page you want to increment the likes on
  def self.incrementLikes(page_id)
    page = Page.find page_id
    likes = 0
    if(!page.likes.nil?)
      likes = page.likes
    end
    likes = likes + 1
    page.update_attribute(:likes, likes)
  end

end