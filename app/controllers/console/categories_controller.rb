class Console::CategoriesController < Console::BaseController
  def index
    @page_title = '分类管理'
    @categories = Category.page(params[:page])
  end

  def new
    @page_title = '分类新增'
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to console_categories_path, notice: '添加成功'
    else
      render action: 'new'
    end
  end

  def edit
    @page_title = '修改分类'
    @category = Category.find params[:id]
  end

  def update
    if Category.find(params[:id]).update_attributes category_params
      redirect_to console_categories_path, notice: '修改成功'
    else
      render action:'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to console_categories_path, notice: '删除成功'
  end

  private

  def category_params
    params.require(:category).permit(:name, :desc)
  end
end
