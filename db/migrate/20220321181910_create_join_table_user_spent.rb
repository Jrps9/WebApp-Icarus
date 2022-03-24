class CreateJoinTableUserSpent < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :spents do |t|
      t.index [:user_id, :spent_id]
      t.index [:spent_id, :user_id]
    end
  end
end
