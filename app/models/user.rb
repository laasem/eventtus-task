class User < ApplicationRecord
  before_save :titleize_full_name_and_title

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  validates :full_name, presence: true, length: {minimum: 1, maximum: 40}, format: {with: /\w*/}
  validates :profile_picture, presence: true, length: {minimum: 1}, format: {with: /\w*/}
  validates :job_title, presence: true, length: {minimum: 1, maximum: 100}, format: {with: /\w*/}

  def titleize_full_name_and_title
    self.full_name = self.full_name.titleize
    self.job_title = self.job_title.titleize
  end
end