class AddUrlToVisits < ActiveRecord::Migration[7.0]
  def change
    add_reference :visits, :url, null: false, foreign_key: true
  end
end
