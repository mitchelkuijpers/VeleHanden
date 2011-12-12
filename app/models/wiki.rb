class Wiki
  include Mongoid::Document

  #Fields
  field :title, type: String
  field :description, type: String

  #Validation
  validates_presence_of :title
  validates_uniqueness_of :title

  #Relations
  has_many :pages

end