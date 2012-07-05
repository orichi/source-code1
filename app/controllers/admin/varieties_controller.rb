class Admin::VarietiesController < AdminController
  before_filter :init_variety,:only=>[:index,:show,:edit,:update,:destroy,:new,:create]
  def index
    @varieties = @business.varieties
  end
  def show
    @variety = Variety.find(params[:id])
  end
  def edit
    @variety = Variety.find(params[:id])
  end
  def update
    @variety = Variety.find(params[:id])
    if @variety.update_attributes(params[:variety])
      flash[:notice]="修改成功"
      redirect_to(admin_business_varieties_path(:business_id=>@business))
    else
      render :edit
    end
  end
  def new
    @variety = Variety.new
  end
  def create
    @variety = Variety.new(params[:variety])
    if @variety.save
      redirect_to(admin_business_varieties_path(:business_id=>@business,flash[:notice]=>"添加成功"))
    else
      render :new
    end
  end
  def destroy
    @variety = Variety.find(params[:id])
    @variety.destroy
    redirect_to(admin_business_varieties_path(:business_id=>@business,flash[:notice]=>"删除成功"))
  end


  private
  def init_variety
    @business = Business.find(params[:business_id])
  end
end