class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :desc
      t.boolean :done
      t.integer :user_id

      t.timestamps
    end
    add_index :items, :user_id
  end
  
  def self.down
    drop_table :items
  end
end
