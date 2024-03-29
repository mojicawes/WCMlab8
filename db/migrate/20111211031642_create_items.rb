class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.text :body
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
