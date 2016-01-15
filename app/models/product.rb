class Product < ActiveRecord::Base
  belongs_to :user
  has_many :line_products, dependent: :destroy

  validates :name, :price, :image, presence: true
  validates :price, :numericality => { :greater_or_equal_to => 0.01}
  
  
end
