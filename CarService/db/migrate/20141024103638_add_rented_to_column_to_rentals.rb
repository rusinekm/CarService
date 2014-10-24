class AddRentedToColumnToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :rented_to, :date
  end
end
