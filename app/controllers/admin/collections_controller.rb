class Admin::CollectionsController < AdminController
  before_filter :init_collection, :only => [:show, :edit,:update, :destroy]
  
  def index
    @collections = Collection.all.paginate(:page => params[:page],:per_page => 2)
  end

  def new
     @collection = Collection.new
  end

  def create
    @collection = Collection.new(params[:collection])
    if @collection.save
      redirect_to(admin_collections_path, :notice => '添加成功！')
    else
      render :action => "new"
    end
  end

  def update
    if @collection.update_attributes(params[:collection])
      redirect_to(admin_collections_path, :notice => '更新成功！')
    else
      render :action => "edit"
    end
  end

  def destroy
    @collection.destroy
    redirect_to(admin_collections_url)
  end

  private
  def init_collection
    @collection =  Collection.find(params[:id])
  end

end
