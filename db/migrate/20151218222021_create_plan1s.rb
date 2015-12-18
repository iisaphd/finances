class CreatePlan1s < ActiveRecord::Migration
  def change
    create_table :plan1s do |t|
      t.integer :age
      t.float :assets
      t.float :col
      t.float :assets2
      t.float :rate
      t.float :interest
      t.float :ss
      t.float :eoyvalue
      t.float :change

      t.timestamps null: false
    end
  end
end
