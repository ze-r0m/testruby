class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, :email, presence:  true
end
