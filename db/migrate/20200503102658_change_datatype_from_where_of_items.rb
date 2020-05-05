class ChangeDatatypeFromWhereOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :from_where, :integer
  end
end
