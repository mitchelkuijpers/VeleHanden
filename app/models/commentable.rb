module Commentable

  def self.included model

    # Associations
    model.has_many :comments, as: :commentable

  end

  # Get the class of a commentable by name
  # @param class_name
  def self.getInstance class_name
    unless class_name.kind_of? String
      raise 'Need a string to determine the class.'
    end
    klass = Kernel.const_get(class_name)
    unless klass.include? Commentable
      raise "Not a commentable class."
    end
    return klass
  end

end