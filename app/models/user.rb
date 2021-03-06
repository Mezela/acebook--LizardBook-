class User < ApplicationRecord
  after_validation :set_slug, only: [:create, :update]

  has_secure_password
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :comment_likes

  validates :username, presence: true, uniqueness: true

  validates :password, presence: true, length: { minimum: 6, maximum: 10 }, :if => :password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, presence: true
  validates :birthday, presence: true

  private

  def set_slug
    self.slug = username.to_s.parameterize
  end
end
