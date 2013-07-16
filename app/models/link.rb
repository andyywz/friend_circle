class Link < ActiveRecord::Base
  attr_accessible :post_id, :url

  belongs_to :post
end
