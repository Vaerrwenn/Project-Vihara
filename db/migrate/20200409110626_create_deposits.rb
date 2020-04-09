class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.string :receipt_no
      t.string :currency, limit: 4
      t.decimal :value, precision: 16, scale: 2
      t.string :submitted_by
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
