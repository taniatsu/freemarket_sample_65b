class ChangeDatatypeFeeWhichOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :fee_which, :integer
  end
end
