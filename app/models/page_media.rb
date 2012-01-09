class PageMedia
  include Mongoid::Document

  field :title, type: String
  field :photo_uid, type: String
  image_accessor :photo

  belongs_to :page
end