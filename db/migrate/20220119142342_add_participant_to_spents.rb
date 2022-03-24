class AddParticipantToSpents < ActiveRecord::Migration[6.1]
  def change
    add_column :spents, :participants, :string, array: true
  end
end
