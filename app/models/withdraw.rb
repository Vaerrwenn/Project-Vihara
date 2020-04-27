class Withdraw < ApplicationRecord
  belongs_to :member
  validates :receipt_no, presence: true
  validates :withdrawal_type, presence: true
  validates :currency, presence: true
  validates :value, presence: true
end
