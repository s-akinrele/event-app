class User < ApplicationRecord
  rolify

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
