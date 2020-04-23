class Member < ApplicationRecord
  has_many :deposits, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
  validates :cetya, presence: true
end
