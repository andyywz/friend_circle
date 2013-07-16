class Post < ActiveRecord::Base
  attr_accessible :body, :title, :links_attributes, :user_id, :circle_ids

  validates :body, :title, presence: true

  belongs_to :user
  has_many :post_shares
  has_many :links
  has_many :circles, through: :post_shares

  accepts_nested_attributes_for :links, reject_if: :all_blank
end
