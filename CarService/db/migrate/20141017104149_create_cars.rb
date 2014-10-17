class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :production_year
      t.integer :mileage
      t.date :last_service

      t.timestamps
    end
  end
end
