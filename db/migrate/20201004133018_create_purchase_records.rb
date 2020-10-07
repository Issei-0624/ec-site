class CreatePurchaseRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_records do |t|
      t.references :user,unique: true,foreign_key: true

      t.timestamps
    end
  end
end
