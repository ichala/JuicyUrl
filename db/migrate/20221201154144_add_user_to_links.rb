class AddUserToLinks < ActiveRecord::Migration[7.0]
  def change
    add_reference :urls, :user, null: false, foreign_key: true
  end
end
