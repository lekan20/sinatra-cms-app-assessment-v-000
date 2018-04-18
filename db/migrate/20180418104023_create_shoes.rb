class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :brand
      t.integer :user_id
    end
  end
end
