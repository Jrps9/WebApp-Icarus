class AddNameColumnToSpents < ActiveRecord::Migration[6.0]
  def change
    add_column :spents, :name, :string, null: false
    add_column :spents, :description, :text
  end
end
