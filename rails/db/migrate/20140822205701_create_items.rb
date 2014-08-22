class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :mc_id
      t.integer :dmg
      t.integer :qty
      t.string :name
      t.string :raw_name
      t.integer :max_dmg

      t.timestamps
    end
    add_index :items, :mc_id
    add_index :items, :name
  end
end
