class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.text :alias , null: false
      t.text :original_link , null: false
      t.timestamps
    end
  end
end
