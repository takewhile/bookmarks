class Link
  include Mongoid::Document
  field :url, :type => String
  field :title, :type => String
  field :description, :type => String

  embedded_in :post
end
