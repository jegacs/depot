class Order < ActiveRecord::Base
  belongs_to :cart
  has_one :order_status, dependent: :destroy

  
  
  
end
