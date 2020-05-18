class Transaction < ApplicationRecord
  belongs_to :member
  validates :transaction_date, presence: :true
  validates :receipt_no, presence: :true
  validates :transaction_type, presence: :true
  validates :saving_type, presence: :true
  validates :currency, presence: :true 
  validates :money_value, presence: :true
end
