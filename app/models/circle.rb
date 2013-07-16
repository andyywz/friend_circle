class Circle < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :circle_memberships

end
