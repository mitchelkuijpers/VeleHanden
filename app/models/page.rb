class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  #Fields
  field :title, type: String

  #Comments
  include Commentable

  #Relations
  has_many :page_contents
  belongs_to :wiki

end