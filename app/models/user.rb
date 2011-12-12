class User
  include Mongoid::Document
  include Mongoid::Timestamps

  include Commentable

  field :name
  validates_presence_of :name, :image
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :image, :image_uid

  field :image_uid, type: String
  image_accessor :image

  #Relations
  has_many :pages

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # create static functions
  class << self

    # Search for users with a certain name. Uses regex for more advanced search.
    #
    # @param name [String] The user's (partial) name
    # @return [Array] List of matching users
    #
    def search_by_name name
      name.sub! /[^ a-z]/i, ''
      unless name.blank?
        where name: /#{name}/i
      else
        []
      end
    end


  end

end
