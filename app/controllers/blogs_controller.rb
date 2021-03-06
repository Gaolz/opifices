class BlogsController < ApplicationController
  caches_page :show
  def index
    @blogs = Blog.order(created_at: :desc).page(params[:page]).per(6)
    params[:page].blank? ? @page_title = '首页' : @page_title = "第#{params[:page]}页"
  end

  def category
    @category = Category.find params[:id].per(6)
    if @category
      @page_title = @category.name
      @blogs = Blog.order(created_at: :desc).where(category_id: @category.id).page(params[:page])
      render 'blogs/index'
    else
      redirect_to root_path, alert: '您所访问的博文分类不存在'
    end
  end

  def show
    @blog = Blog.find_by(slug_url: params[:slug])
    redirect_to root_path, alert: '您所访问的博文不存在' unless @blog
  end
end