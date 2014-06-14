class CategoriesCell < Cell::Rails

  def index
    @categories = Category.all
    render
  end

end
