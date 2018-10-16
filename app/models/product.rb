class Product < ApplicationRecord
  validates :sku, :product_name, :barcode, :price_cents, presence: true
  validates :sku, uniqueness: true
end
