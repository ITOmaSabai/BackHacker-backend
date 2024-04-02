class RenameForeignKey < ActiveRecord::Migration[7.1]
  def change
    rename_column :addresses, :spots_id, :spot_id
    rename_column :comments, :users_id, :user_id
    rename_column :comments, :spots_id, :spot_id
    rename_column :likes, :users_id, :user_id
    rename_column :likes, :spots_id, :spot_id
    remove_column :spots, :users_id
    add_foreign_key :spots, :users
    rename_column :videos, :spots_id, :spot_id
  end
end
