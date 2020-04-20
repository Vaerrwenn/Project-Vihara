class Deposit < ApplicationRecord
  belongs_to :member
  validates :receipt_no, presence: true
  validates :type, presence: true
  validates :currency, presence: true
  validates :value, presence: true
end
