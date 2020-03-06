class CreateFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :formations do |t|
      
      t.string :title
      t.text :description
      t.integer :price
      t.string :picture_url
      t.string :categorie
      t.integer :session
      t.integer  :ref
      t.date :sale
      t.string :tag
      t.string :campus
      t.string :place
      
      t.timestamps
    end
  end
end
