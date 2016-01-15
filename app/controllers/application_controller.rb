class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  helper_method :is_admin?
  
  def current_cart
    cart = Cart.find_by_user_id(current_user.id) # Identificamos el carrito por el usuario
  if cart.nil?
    cart = Cart.create
    Cart.find(cart.id).update_attribute(:user_id, current_user.id) # ESTO NO DEBE HACERSE, ROMPO
    # con la modularizacion.
    
    cart = Cart.find_by_user_id(current_user.id)
  end
  session[:cart_id] = cart.id
  cart
  
  end

  def is_admin?
    current_user.try(:admin?)
  end

  
end
