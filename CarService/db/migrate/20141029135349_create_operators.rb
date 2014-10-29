class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :login
      t.string :password_digest

      t.timestamps
    end
  end
end
