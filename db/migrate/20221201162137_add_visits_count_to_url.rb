class AddVisitsCountToUrl < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :visits_count, :integer
  end
end
