class AdminController < ApplicationController
  before_action :authenticate_user!, :authenticate_admin
  
  def panel
    @products = Product.all
    @orders = Order.all
  end

  private
  def authenticate_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end
    
end
