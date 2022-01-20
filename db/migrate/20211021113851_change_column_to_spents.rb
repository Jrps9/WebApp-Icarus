class ChangeColumnToSpents < ActiveRecord::Migration[6.1]
  def change
    change_column_null :spents, :white_spent, false
  end
end
