class Cart < ApplicationRecord

    belongs_to :user
    has_many :line_items
  
    def cart_total
      sum = 0
      self.line_items.each do |line_item|
        if line_item.formation.price == nil
          line_item.formation.price = 1
        end
        sum+= line_item.formation.price
      end
      return sum
    end
    
    def self.current_cart_id
      self.all.find_by(user_id: current_user.id)
    end
  
    def destroy
      self.line_items.each do |line_item|
        line_item.destroy
      end
    end

end
