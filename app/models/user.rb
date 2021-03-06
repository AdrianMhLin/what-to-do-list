class User < ActiveRecord::Base
  validates(:password, :email, {presence: true})
  validates :email, {uniqueness: true}

  has_many :todos, dependent: :destroy
  has_secure_password
end
