class RenameMonthColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :month, :month_id
  end
end
