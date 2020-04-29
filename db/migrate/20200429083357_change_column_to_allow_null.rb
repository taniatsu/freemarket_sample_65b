class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def up
    change_column :items, :buyer_id,:integer, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :items, :buyer_id,:integer, null: false
  end
end
