class AddDetailsToFormations < ActiveRecord::Migration[5.2]
  def change
    add_column :formations, :user_id, :bigint
  end
end
