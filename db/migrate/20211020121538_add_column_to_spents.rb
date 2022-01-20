class AddColumnToSpents < ActiveRecord::Migration[6.0]
  def change
    add_column :spents, :white_spent, :integer
    add_column :spents, :black_spent, :integer
  end
end
