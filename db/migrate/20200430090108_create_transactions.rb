class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :receipt_no
      t.string :withdraw_or_deposit
      t.string :transaction_type #saving_type
      t.string :currency, limit: 4
      t.decimal :money_value, precision: 16, scale: 4
      t.string :desc
      t.string :submitted_by
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
