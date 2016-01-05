class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.decimal :price

      t.timestamps null: false

    end
  end
end
