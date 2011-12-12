class PageContent
  include Mongoid::Document

  field :title, type: String

  belongs_to :page
end