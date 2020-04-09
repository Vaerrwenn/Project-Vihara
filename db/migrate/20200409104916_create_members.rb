class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :cetya
      t.string :phone, limit: 20
      t.decimal :total, precision: 14, scale: 2

      t.timestamps
    end
  end
end
