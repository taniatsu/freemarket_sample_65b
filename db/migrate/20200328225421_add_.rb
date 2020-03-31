class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_confirmation, :string, after: :encrypted_password
  end
end
