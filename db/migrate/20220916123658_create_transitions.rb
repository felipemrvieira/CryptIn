class CreateTransitions < ActiveRecord::Migration[7.0]
  def change
    create_table :transitions do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
