class PagePhoto < PageContent

  field :photo_uid, type: String
  image_accessor :photo

end