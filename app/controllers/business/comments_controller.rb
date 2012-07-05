class Business::CommentsController < BusinessController
  def index
    @comments = @current_business.comments.order("id desc").paginate(:page => params[:page],:per_page => 20)
  end

  def show
    @comment = Comment.find(params[:id])
    @replay_comment = Comment.new(:parent => @comment)
  end

  def create
    #times = Comment.where("parent_id = :parent and created_by_id = :created and created_at>= :start",{:parant => nil,:created=>session[:customer_id],:start=>Time.zone.now.at_beginning_of_day})
#    times = Comment.where(:parent_id=>nil,:created_by_id=>@current_business,:created_at => Time.zone.now.at_beginning_of_day)

    @comment = Comment.new(params[:comment])
    @comment.created_by_id = session[:customer_id]
    @comment.business_id = @current_business.id
    @comment.save
    redirect_to business_discusses_path;
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to business_discuss_path(params[:base])
  end
end
