class Api::V1::ProductsController < ApplicationController
  def index
    @product = params['producer'].present? ? Product.where('producer LIKE ?', "%#{params['producer']}%") : Product.all
    render json: @product
  end
end
