class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|

      t.belongs_to :cart, foreign_key: true
      t.belongs_to :formation, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.integer :quantity
      t.string :order_number
      t.timestamps
    end
  end
end
