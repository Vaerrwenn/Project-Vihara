class Member < ApplicationRecord
  has_many :deposits
  validates :name, presence: true, length: { minimum: 2 }
  validates :cetya, presence: true
end
