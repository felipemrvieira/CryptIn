class CreateCoinWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :coin_wallets do |t|
      t.decimal :balance, precision: 8, scale: 2, default: 0
      t.references :coin, null: false, foreign_key: true
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
