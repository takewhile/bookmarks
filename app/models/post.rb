class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, :type => String
  identity :type => String

  embeds_many :links

  attr_accessible :title

  before_save :generate_identity

  private
  def generate_identity
    require 'active_support/secure_random'
    self._id = ActiveSupport::SecureRandom.hex(16)
  end
end
