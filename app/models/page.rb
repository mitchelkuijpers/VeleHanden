class Page
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  #Comments
  include Commentable

  #Fields
  field :title, type: String
  field :story, type: String


  #Relations
  has_many :page_medias
  belongs_to :wiki

end