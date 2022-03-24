class AddPaidToDebt < ActiveRecord::Migration[6.1]
  def change
    add_column :debts, :paid_1, :boolean, default: false
    add_column :debts, :paid_2, :boolean, default: false
    add_column :debts, :paid_3, :boolean, default: false
  end
end
