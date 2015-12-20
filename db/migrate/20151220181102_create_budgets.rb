class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :year
      t.float :taxes
      t.float :investment401k
      t.float :investmentespp
      t.float :healthinsurance
      t.float :expenses
      t.float :housing
      t.float :remaining
      t.float :bonus

      t.timestamps null: false
    end
  end
end
