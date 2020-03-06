class AddForeignkeyToFormations < ActiveRecord::Migration[5.2]
  def change
    add_reference :formations, :users, foreign_key: true
  end
  
end
