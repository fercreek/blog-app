class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validate_presence_of :user
end
