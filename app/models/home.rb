class Home < ApplicationRecord
    has_many :members
    has_many :transactions, through: :members
end
