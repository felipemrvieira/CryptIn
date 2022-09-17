class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.decimal :balance, precision: 8, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
