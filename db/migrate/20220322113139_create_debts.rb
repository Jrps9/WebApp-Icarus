class CreateDebts < ActiveRecord::Migration[6.1]
  def change
    create_table :debts do |t|
      t.integer :amount
      t.string :participants
      t.references :spent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
