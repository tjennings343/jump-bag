class CreateBagsTable < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :bag_name
      t.belongs_to :user
    end
  end
end
