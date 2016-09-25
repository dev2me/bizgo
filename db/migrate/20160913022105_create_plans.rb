class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :description
      t.integer :num_dias_expires
      t.decimal :price
      
      t.timestamps null: false
    end
  end
end
