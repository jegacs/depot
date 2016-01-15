class OrderStatusController < ApplicationController
private
  def order_params
    params.require(:order_status).permite(:cart_id)
  end
end
