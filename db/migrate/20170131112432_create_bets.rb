class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.integer :user_id, null: false
      t.integer :jogo_id, null: false
      t.integer :valor, null: false
      t.integer :resultado, null: false
      t.timestamps
    end
  end
end
