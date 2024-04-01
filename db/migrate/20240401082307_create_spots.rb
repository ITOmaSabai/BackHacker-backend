class CreateSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :description
      t.string :lat
      t.string :lng
      t.integer :user_id

      t.timestamps
    end
  end
end
