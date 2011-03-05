class Link
  include Mongoid::Document
  field :url, :type => String
  field :title, :type => String
  field :description, :type => String

  validates_presence_of :url

  embedded_in :post
end
