class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy 
  has_many :reactions, dependent: :destroy

  validates :text, length: {maximum: 5000}, format: {with: /\w*/}
  validates :image, format: {with: /\w*/}

  def num_reactions
    self.reactions.count
  end

  def num_comments
    self.comments.count
  end
end