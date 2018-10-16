class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :photo_url
      t.string :barcode
      t.integer :price_cents
      t.string :sku
      t.string :producer

      t.timestamps
    end
  end
end
