class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video

  validates :title, presence: true
  validates :body, presence: true
end
