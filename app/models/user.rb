class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :birthday, presence: true

  has_settings do |s|
    s.key :font
    s.key :background
  end
end
