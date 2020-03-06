class LineItem < ApplicationRecord

    belongs_to :formation
    belongs_to :cart, optional: true
    belongs_to :order, optional: true
  
    def line_item_price
      return self.formation.price
    end
  
end
