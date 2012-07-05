class Business::ActivitiesController < BusinessController
  before_filter :init_activity, :only => [:show, :edit, :subjects, :add_subjects, :remove_subject, :destroy]
  after_filter :notify_customers, :only => [:publish]

  def index
    @activities = @current_business.activities
  end

  def create
    @activity = @current_business.activities.new(params[:activity])
    if @activity.save
      redirect_to(business_activity_path(@activity), :notice => '添加成功！')
    else
      render :action => "new"
    end
  end

  def new
    @activity = @current_business.activities.new
  end

  def update
    @activity = @current_business.activities.find(params[:id])
    if @activity.update_attributes(params[:activity])
      redirect_to(business_activity_path(@activity), :notice => '修改成功！')
    else
      render :action => "edit"
    end
  end

  def publish
    @activity = @current_business.activities.find(params[:id])
    @activity.update_attribute(:publish, true)
    redirect_to(business_activity_path(@activity), :notice => '发布成功！')
  end

  def destroy
    @activity.destroy
    redirect_to business_activities_path
  end

  def subjects
    @subjects = @activity.subjects
    render :layout => false
  end

  def add_subjects
    (params[:subject] || []).each do |subject_id|
      subject = Subject.find(subject_id)
      @activity.subjects << subject unless @activity.subjects.exists?(subject)
    end
    sum = 0
    @activity.price = @activity.subjects.each{|x|sum+=x.price}
    @activity.update_attribute(:price,@activity.subjects.each{|x|sum+=x.price})
    render :js => "parent.add_subjects_succ();"
  end

  def remove_subject
    subject = Subject.find(params[:subject_id])
    @activity.subjects.delete(subject)
    render :js => "load_subjects();"
  end

  private
  def init_activity
    @activity = @current_business.activities.find(params[:id])
  end

  def notify_customers
    @current_business.customers.each do |customer|
      customer.notifications << Notification.new(:resource => @activity)
    end
  end

end
