class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.integer :kind, default: 0
      t.references :wallet_origin, null: false
      t.references :wallet_destination, null: false
      t.references :coin, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :operations, :wallets, column: :wallet_origin_id
    add_foreign_key :operations, :wallets, column: :wallet_destination_id
  end
end
