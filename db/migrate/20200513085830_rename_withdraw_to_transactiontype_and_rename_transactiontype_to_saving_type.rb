class RenameWithdrawToTransactiontypeAndRenameTransactiontypeToSavingType < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :transaction_type, :foo
    rename_column :transactions, :withdraw_or_deposit, :transaction_type
    rename_column :transactions, :foo, :saving_type
  end
end
