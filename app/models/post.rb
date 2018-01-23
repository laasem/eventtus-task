class Post < ApplicationRecord
  belongs_to :user

  validates :text, length: {maximum: 5000}, format: {with: /\w*/}
  validates :image, format: {with: /\w*/}
end
