class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :zip_code, :string, null: false
    add_column :users, :prefecture_id, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :building, :string
    add_column :users, :telephone, :string
  end
end
