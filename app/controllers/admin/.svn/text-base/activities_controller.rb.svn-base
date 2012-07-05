class Admin::ActivitiesController < AdminController
  before_filter :init_activity,:only=>[:index,:show,:edit,:update,:destroy,:new,:create]
  def index
    @activities = @business.activities
  end
  def show
    @activity = Activity.find(params[:id])
  end
  def edit
    @activity = Activity.find(params[:id])
  end
  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(params[:activity])
      redirect_to(admin_business_activities_path(:business_id=>@business,flash[:notice]=>"修改成功"))
    else
      render :edit
    end
  end
  def new
    @activity = Activity.new
  end
  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
      flash[:notice]="添加成功"
      redirect_to(admin_business_activities_path(:business_id=>@business))
    else
      render :new
    end
  end
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:notice] = "添加成功"
    redirect_to(admin_business_activities_path(:business_id=>@business))
  end


    private
    def init_activity
      @business = Business.find(params[:business_id])
    end
  end