class PageLike
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :page

end