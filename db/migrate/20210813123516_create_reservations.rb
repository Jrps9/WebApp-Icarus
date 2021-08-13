class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :destination
      t.text :description
      t.datetime :start_day
      t.datetime :end_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
