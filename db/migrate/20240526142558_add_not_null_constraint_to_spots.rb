class AddNotNullConstraintToSpots < ActiveRecord::Migration[7.1]
  def change
    change_column_null :spots, :name, false
    change_column_null :spots, :lat, false
    change_column_null :spots, :lng, false
  end
end
