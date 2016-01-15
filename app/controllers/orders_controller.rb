
class OrdersController < ApplicationController
  def index
    @order = Order.new
    @total = total_price
  end

  def create
    @order =  Order.new(order_params)
    @order.cart_id = current_cart.id
    @order.totalprice = total_price
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path,
                                  notice: 'Order exitosamente creado' }
      else
        format.html { render :index }
        
      end
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:cart_id, :address, :totalprice)
  end

  def total_price
    cart = current_cart
    price = 0
    cart.line_products.each do | t |
      price += t.product.price * t.quantity
    end
    price
  end
end
