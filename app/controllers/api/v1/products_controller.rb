class Api::V1::ProductsController < ApplicationController
  def index
    render json: ProductsDatatable.new(permitted_params), status: :ok
  end

  private

  def permitted_params
    params.permit(:length, :start, search: [:value])
  end
end
