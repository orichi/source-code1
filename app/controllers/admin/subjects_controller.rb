class Admin::SubjectsController < AdminController
  before_filter :init_subject,:only=>[:index,:show,:edit,:update,:destroy,:new,:create]
  def index
    @varieties = @business.varieties
  end
  def show
    @subject = Subject.find(params[:id])
  end
  def edit
    @subject = Subject.find(params[:id])
  end
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to(admin_business_subjects_path(:business_id=>@business,flash[:notice]=>"修改成功"))
    else
      render :edit
    end
  end
   def new
    @subject = Subject.new
  end
  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      redirect_to(admin_business_subjects_path(:business_id=>@business,flash[:notice]=>"添加成功"))
    else
      render :new
    end
  end
  def destroy
    @subject = Subject.find(params[:id])
    flash[:notice]="删除成功"
    redirect_to(admin_business_subjects_path(:business_id=>@business))
  end


  private
  def init_subject
    @business = Business.find(params[:business_id])
  end
end