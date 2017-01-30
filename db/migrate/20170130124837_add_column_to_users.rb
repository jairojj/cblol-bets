class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :coin, :integer, default: 1000, null: false
  end
end
