# frozen_string_literal: true
require 'csv'
require 'open-uri'

class ParseProducts
  def self.perform(file: open(ENV['CSV_URL']))
    CSV.foreach(file, :headers => true) do |row|
      rh = row.to_hash
      Product.where(product_name: rh['product_name'],
                    photo_url: rh['photo_url'],
                    barcode: rh['barcode'],
                    price_cents: rh['price_cents'],
                    sku: rh['sku (unique id)'],
                    producer: rh['producer'])
             .first_or_create
    end
  rescue => e
    Rails.logger.debug("CSV parse & saving failed: #{e.message}")
  end
end
