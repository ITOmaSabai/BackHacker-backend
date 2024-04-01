class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :administrative_area_level_1
      t.string :formatted_address

      t.timestamps
    end
  end
end
