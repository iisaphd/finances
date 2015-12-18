class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.datetime :transactiondate
      t.string :type
      t.float :amount
      t.float :heloc
      t.float :escrowdebt
      t.float :escrowremaining
      t.float :escrowowed
      t.float :loanfunds
      t.float :loanremaining

      t.timestamps null: false
    end
  end
end
