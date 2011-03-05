class Post
  include Mongoid::Document
  field :title, :type => String
  field :slug, :type => String
end
