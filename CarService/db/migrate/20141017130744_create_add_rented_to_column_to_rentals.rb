class CreateAddRentedToColumnToRentals < ActiveRecord::Migration
  def change
    create_table :add_rented_to_column_to_rentals do |t|
      t.date :rented_to

      t.timestamps
    end
  end
end
