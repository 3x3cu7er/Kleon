class User < ApplicationRecord
  has_many :posts
  has_many :advertisements
  has_many :messages
  has_many :chats

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end


