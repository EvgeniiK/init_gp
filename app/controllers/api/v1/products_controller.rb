class Api::V1::ProductsController < ApplicationController
  def index
    render json: ProductsDatatable.new(params), status: :ok
  end
end
