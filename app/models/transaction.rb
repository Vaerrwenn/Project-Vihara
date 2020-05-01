class Transaction < ApplicationRecord
  belongs_to :member
  validates :receipt_no, presence: :true
  validates :withdraw_or_deposit, presence: :true
  validates :transaction_type, presence: :true
  validates :currency, presence: :true 
  validates :money_value, presence: :true
end
