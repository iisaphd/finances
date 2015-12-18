class CreateSavings < ActiveRecord::Migration
  def change
    create_table :savings do |t|
      t.datetime :transactiondate
      t.string :type
      t.float :amount
      t.float :yeartodate
      t.float :totalsavings
      t.float :valueatretirement
      t.float :totalvalue

      t.timestamps null: false
    end
  end
end
