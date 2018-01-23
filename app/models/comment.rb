class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, length: {maximum: 5000}, format: {with: /\w*/}
  validates :image, format: {with: /\w*/}
end