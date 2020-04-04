class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :user_id, foreign_key: true, null: false
      t.integer :category_id, foreign_key: true, null: false
      t.string :name, null: false
      t.string :brand
      t.text :explanation, null: false
      t.string :condition
      t.integer :price, null: false
      t.string :size, null: false
      t.string :fee_which, null: false
      t.string :from_where, null: false
      t.string :delivery_date, null: false
      t.string :status, null: false
      t.integer :buyer_id, null: false,class_name: "User", foreign_key: "buyer_id"
      t.integer :seller_id, null: false, class_name: "User", foreign_key: "seller_id"
      t.timestamps
    end
  end
end
