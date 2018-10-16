class ProductsDatatable
  def initialize(params)
    @params = params
  end

  def as_json(options = {})
    { recordsTotal: Product.count,
      recordsFiltered: products.total_count }
        .merge(products: ActiveModelSerializers::SerializableResource.new(products).as_json)
  end

  private

  def products
    @products ||= fetch_products
  end

  def fetch_products
    if @params[:search][:value].present?
      search = "%#{@params[:search][:value].downcase}%"
      Product.where('lower(producer) LIKE ?', search).page(page).per(per_page)
    else
      Product.all.page(page).per(per_page)
    end
  end

  def page
    @params[:start].to_i / per_page + 1
  end

  def per_page
    @params[:length].to_i > 0 ? @params[:length].to_i : 10
  end
end