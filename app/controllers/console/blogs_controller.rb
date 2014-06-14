class Console::BlogsController < Console::BaseController
  def index
    @page_title = '博文管理'
    @blogs = Blog.order(created_at: :desc).page(params[:page])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new blog_params
    if @blog.save
      redirect_to console_blogs_path, notice: '发表成功'
    else
      render action: 'new'
    end
  end

  def edit
    @blog = Blog.find params[:id]
  end

  def update
    if Blog.find(params[:id]).update_attributes blog_params
      redirect_to console_blogs_path, notice: '更新成功'
    else
      render action:'edit'
    end
  end

  def destroy
    Blog.find(params[:id]).destroy
    redirect_to console_blogs_path, notice: '删除成功'
  end

  private

  def blog_params
    params.require(:blog).permit(:title,:slug_url,:category_id,:context,:reference_url,:thumb ,:thumb_cache)
  end
end
