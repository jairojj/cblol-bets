class CreateJogos < ActiveRecord::Migration[5.0]
  def change
    create_table :jogos do |t|
      t.string   :time1, null: false
      t.string   :time2, null: false
      t.date     :data, null: false
      t.integer  :resultado
      t.integer  :contagem_vit1, null: false, default: 0
      t.integer  :contagem_empate, null: false, default: 0
      t.integer  :contagem_vit2, null: false, default: 0
      t.integer  :semana, null: false
      t.boolean  :status, null: false, default: false
      
      t.timestamps
    end
  end
end
