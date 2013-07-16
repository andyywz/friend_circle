class PostShare < ActiveRecord::Base
  attr_accessible :circle_id, :post_id

  belongs_to :circle
  belongs_to :post
end
