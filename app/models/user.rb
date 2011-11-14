class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # status functions
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
