class ChangeDatatypeSizeOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :size, :integer
  end
end
