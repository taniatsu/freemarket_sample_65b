class RenameDayColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :day, :day_id
  end
end
