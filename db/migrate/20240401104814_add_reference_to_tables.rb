class AddReferenceToTables < ActiveRecord::Migration[7.1]
  def change
    add_reference :addresses, :spots, null: false, foreign_key: true
    add_reference :comments, :users, null: false, foreign_key: true
    add_reference :comments, :spots, null: false, foreign_key: true
    add_reference :likes, :users, null: false, foreign_key: true
    add_reference :likes, :spots, null: false, foreign_key: true
    add_reference :spots, :users, null: false, foreign_key: true
    add_reference :videos, :spots, null: false, foreign_key: true
  end
end
