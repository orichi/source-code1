class Admin::CommentsController < AdminController
  before_filter :init_business, :only => [:show, :edit,:update, :destroy]
  
  def index
    @businesses = Business.all.paginate(:page => params[:page],:per_page => 2)
  end

  def new
    @business = Business.new
  end

  def products
    @business = Business.find(params[:id])
  end
  def activities
    @business = Business.find(params[:id])
  end
  def create
    @business = Business.new(params[:business])
    @business.password = Utilities.rand_chars(8)
    if @business.save
      redirect_to(admin_businesses_path, :notice => '添加成功！')
    else
      render :action => "new"
    end
  end

  def update
    if @business.update_attributes(params[:business])
      redirect_to(admin_businesses_path, :notice => '更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @business.destroy
    redirect_to(admin_businesses_url)
  end
  def remove_subject
    @subject = Subject.find(params[:subject_id])
    @subject.destroy
    redirect_to(products_admin_business_path(params[:id]),flash[:notice]=>"成功删除")
  end
  def remove_activity
    @activity= Activity.find(params[:activity_id])
    @activity.destroy
    redirect_to(activities_admin_business_path(params[:id]),flash[:notice]=>"成功删除")
  end

  private
  def init_business
    @business =  Business.find(params[:id])
  end

end
