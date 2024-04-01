class ChangeLatAndLngToFloatInSpots < ActiveRecord::Migration[7.1]
  def up
    change_column :spots, :lat, 'float USING CAST(lat AS float)'
    change_column :spots, :lng, 'float USING CAST(lng AS float)'
  end

  def down
    change_column :spots, :lat, :string
    change_column :spots, :lng, :string
  end
end
