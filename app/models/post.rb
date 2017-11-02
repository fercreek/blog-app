class Post < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  has_many :comments

  has_many :taggings
  has_many :tags, through: :taggings
end
