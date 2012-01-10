class Page
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  #Comments
  include Commentable

  #Fields
  field :title, type: String
  field :story, type: String
  field :summary, type: String

  #Image
  field :photo_uid, type: String
  image_accessor :photo

  #Relations
  has_many :page_medias
  has_many :page_likes
  belongs_to :wiki
  belongs_to :user

end