class AddAcronymToCoin < ActiveRecord::Migration[7.0]
  def change
    add_column :coins, :acronym, :string
  end
end
