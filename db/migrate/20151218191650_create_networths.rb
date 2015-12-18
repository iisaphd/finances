class CreateNetworths < ActiveRecord::Migration
  def change
    create_table :networths do |t|
      t.datetime :dateofrecord
      t.float :assets
      t.float :debts
      t.float :networth
      t.float :change
      t.float :changerate

      t.timestamps null: false
    end
  end
end
