class Product < ActiveRecord::Base
  belongs_to :user
  has_many :line_products, dependent: :destroy
  
end
