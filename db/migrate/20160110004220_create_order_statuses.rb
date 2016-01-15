class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.references :order, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
