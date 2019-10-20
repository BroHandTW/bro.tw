class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :user, foreign_key: true
      t.references :visitor, foreign_key: true
      t.text :url
      t.string :md5
      t.string :slug

      t.timestamps
      t.date :created_date
    end
    add_index :links, %i[visitor_id md5], unique: true
    add_index :links, :slug, unique: true
  end
end
