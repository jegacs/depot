class ChangeDefaultToOrderStatus < ActiveRecord::Migration
  def change
    change_column :order_statuses, :status, :string, default: 'Sin atender'
  end

end
