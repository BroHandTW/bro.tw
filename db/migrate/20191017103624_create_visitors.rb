class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :visitor_token

      t.timestamps
      t.date :created_date

      # counter_cache for link
      t.integer :links_count, default: 0, null: false
    end
    add_index :visitors, [:visitor_token], unique: true
  end
end
