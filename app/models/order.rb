class Order < ActiveRecord::Base
  belongs_to :cart
  has_one :order_status, dependent: :destroy
  validates :status,
            :inclusion => { :in => [ 'Sin Atender', 'Atendida'],
                            :message => "%{value} no es un status valido"}
  validates :address, presence: true
  
  
  
end
