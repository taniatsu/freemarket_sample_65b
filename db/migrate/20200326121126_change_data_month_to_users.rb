class ChangeDataMonthToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :month, :integer
    change_column :users, :day, :integer
  end
end
