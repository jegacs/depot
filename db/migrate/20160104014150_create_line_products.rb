class CreateLineProducts < ActiveRecord::Migration
  def change
    create_table :line_products do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity, default: 1
      t.timestamps null: false

    end
  end
end
