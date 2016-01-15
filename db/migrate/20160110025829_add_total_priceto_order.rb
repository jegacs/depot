class AddTotalPricetoOrder < ActiveRecord::Migration
  def change
    add_column :orders, :totalprice, :integer
  end
end
