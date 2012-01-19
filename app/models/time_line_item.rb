class TimeLineItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :happening, type: String
  field :happened_at, type: Date

  belongs_to :page

end