class Admin::MsgsController < AdminController
  before_filter :init_msg, :only => [:show, :edit,:update, :destroy]
  
  def index
    @msgs = Msg.all.paginate(:page => params[:page],:per_page => 2)
  end

  def new
     @msg = Msg.new 
  end

  def create
    @msg = Msg.new(params[:msg])
    if @msg.save
      redirect_to(admin_msgs_path, :notice => '添加成功！')
    else
      render :action => "new"
    end
  end

  def update
    if @msg.update_attributes(params[:msg])
      redirect_to(admin_collections_path, :notice => '更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @msg.destroy
    redirect_to(admin_msgs_url)
  end

  private
  def init_msg
    @msg =  Msg.find(params[:id])
  end

end
