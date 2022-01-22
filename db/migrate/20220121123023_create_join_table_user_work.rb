class CreateJoinTableUserWork < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :works do |t|
      t.index [:user_id, :work_id]
      t.index [:work_id, :user_id]
    end
  end
end
