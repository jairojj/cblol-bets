class AddColumnToBet < ActiveRecord::Migration[5.0]
  def change
    add_column :bets, :ganhou_qnt, :integer, default: 0
  end
end
