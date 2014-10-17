class CreateAddPeselColumnToUsers < ActiveRecord::Migration
  def change
    create_table :add_pesel_column_to_users do |t|
      t.integer :pesel

      t.timestamps
    end
  end
end
