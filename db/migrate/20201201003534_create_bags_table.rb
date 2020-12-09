class CreateBagsTable < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :bag_name
      t.string :bag_contents
      t.belongs_to :user
    end
  end
end
