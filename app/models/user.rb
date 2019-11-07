

class User < ApplicationRecord
  has_secure_password
  # include Storext.model

  has_many :posts
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :birthday, presence: true

  store_attributes :settings do
    font_family String, default: 'LightIkaros'
    background_colour String, default: '#EDBB99'
  end
end
