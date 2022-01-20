class CreateSpents < ActiveRecord::Migration[6.0]
  def change
    create_table :spents do |t|

      t.timestamps
    end
  end
end
