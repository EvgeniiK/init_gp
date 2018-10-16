class ProductSerializer < ActiveModel::Serializer
  attributes(*Product.attribute_names.map(&:to_sym))
end
