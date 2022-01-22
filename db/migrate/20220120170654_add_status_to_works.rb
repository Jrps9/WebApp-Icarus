class AddStatusToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :status, :boolean, default: false
  end
end
