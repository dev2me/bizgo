class AddNivelToUser < ActiveRecord::Migration
  def change
    add_column :users, :nivel, :integer, default: 0
    add_column :users, :avatar, :string
  end
end
