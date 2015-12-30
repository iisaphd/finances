class AddPctnwToNetworths < ActiveRecord::Migration
  def change
    add_column :networths, :pctnw, :float
  end
end
