class Member < ApplicationRecord
  has_many :deposits, dependent: :destroy
  has_many :withdraws, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
  validates :cetya, presence: true
end
