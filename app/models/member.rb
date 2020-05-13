class Member < ApplicationRecord
  has_many :transactions, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
  validates :cetya, presence: true
end
