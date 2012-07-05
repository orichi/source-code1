class Admin::CategoriesController < AdminController
  before_filter :init_category, :only => [:show, :edit,:update, :destroy]
  
  def index
    @categories = Category.all
  end

  def new
     @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to(admin_categories_path, :notice => '添加成功！')
    else
      render :action => "new"
    end
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to(admin_categories_path, :notice => '更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @category.destroy
    redirect_to(admin_categories_url)
  end

  private
  def init_category
    @category =  Category.find(params[:id])
  end

end
