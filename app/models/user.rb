class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 8..32 },format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/ }
  validates :image, presence: true

  has_secure_password
mount_uploader :image, ImageUploader

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
