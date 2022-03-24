class CreateJoinTableUserDebt < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :debts do |t|
      t.index [:user_id, :debt_id]
      t.index [:debt_id, :user_id]
    end
  end
end
