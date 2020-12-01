class CreateBagsTable < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :bag_name
      t.string :item
      t.integer :item_quantity
      t.integer :user_id
    end
  end
end
