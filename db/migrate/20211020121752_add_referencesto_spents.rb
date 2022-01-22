class AddReferencestoSpents < ActiveRecord::Migration[6.0]
  def change
    add_reference :spents, :user, index: true
  end
end
