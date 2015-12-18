class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.datetime :dateofrecord
      t.float :checkingacct
      t.float :escrowacct
      t.float :helocacct
      t.float :amexacct
      t.float :capitaloneacct
      t.float :escrowdebt
      t.float :aonacct
      t.float :ssbacct
      t.float :home
      t.float :loanacct
      t.float :assets
      t.float :debts
      t.float :networth
      t.float :change
      t.float :investments

      t.timestamps null: false
    end
  end
end
