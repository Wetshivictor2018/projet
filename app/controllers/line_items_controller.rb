class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_cart
  
  def new
    chosen_formation = Formation.find(params[:format])
    line_item = LineItem.find_by(cart_id: @current_cart.id, formation_id: chosen_formation.id)
    if line_item != nil
      redirect_to(cart_path(@current_cart.id), alert: 'This formation is already in your cart.')
      return
    else
      line_item = LineItem.new
      line_item.cart_id = @current_cart.id
      line_item.formation_id = chosen_formation.id
      line_item.quantity = 1
    end

    if line_item.save
      redirect_to cart_path(@current_cart.id), notice: 'New item was successfully added to cart.'
    else
      render :new
    end

  end

  def destroy
    LineItem.find(params[:id]).destroy
    redirect_to cart_path(@current_cart.id), notice: 'Item was successfully removed from cart.'
  end


  private

  def set_current_cart
    @current_cart = Cart.find_by(user_id: current_user.id)
  end

end
