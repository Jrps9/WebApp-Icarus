class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :name
      t.string :participants
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
