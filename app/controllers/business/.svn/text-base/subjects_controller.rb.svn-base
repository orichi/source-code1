class Business::SubjectsController < BusinessController
   before_filter :init_subject, :only => [:show, :edit,:update, :destroy]
   layout "business_simple"
  
  def index
    @current_variety = params[:var_id] ? Variety.find(params[:var_id]) : Variety.first
    @varieties = @current_business.varieties
  end

  def choose_subjects
    @subjects = @current_business.subjects.paginate(:page => params[:page],:per_page => 10)
    render :layout => "simple"
  end

  def new
     @subject = @current_business.subjects.new
  end

  def create
    @subject = @current_business.subjects.new(params[:subject])
    if @subject.save
      notify_customers
      redirect_to(business_subjects_path(:var_id => @subject.variety.id), :notice => '添加成功！')
    else
      render :action => "new"
    end
  end

  def update
    if @subject.update_attributes(params[:subject])
      redirect_to(business_subjects_path, :notice => '更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @subject.destroy
    redirect_to(business_subjects_url(:var_id => params[:var_id]))
  end

  private
  def init_subject
    @subject =  Subject.find(params[:id])
  end

  def notify_customers
    @current_business.customers.each do |customer|
      customer.notifications << Notification.new(:resource => @subject)
    end
  end
end
