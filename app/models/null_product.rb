class NullProduct
  def id
    nil
  end

  def name
    "product"
  end

  def description
    "description"
  end

  def image_url
    'www.example.com'
  end

  def price
    0
  end
end

# usage
# Product.find_by(id: params[:id])  || NullProduct.new