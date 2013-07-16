class Circle < ActiveRecord::Base
  attr_accessible :name, :user_id, :member_ids

  validates :name, :user_id, presence: true
  validates :name, uniqueness: true

  belongs_to :user
  has_many :circle_memberships
  has_many :post_shares
  #tells rails that :members really refers to :user
  has_many :members, through: :circle_memberships, source: :user
  has_many :posts, through: :post_shares
end
