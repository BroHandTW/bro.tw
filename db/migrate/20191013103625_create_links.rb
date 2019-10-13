class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :user, foreign_key: true
      t.text :url
      t.string :md5
      t.string :slug

      t.timestamps
    end
    add_index :links, :md5, unique: true
    add_index :links, :slug, unique: true
  end
end
