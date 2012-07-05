class Admin::Score::CusscoresController < AdminController
  before_filter :init,:only=>[:index,:edit,:update]
  def index
    @cusscores = Customer.order("id desc").all.paginate(:page => params[:page],:per_page => 2)
  end
  def edit
    @cusscore = Customer.find(params[:id])
  end
  def update
    @cusscore = Customer.find(params[:id])
    if @cusscore.update_attributes(params[:customer])
      redirect_to admin_score_cusscores_path
    end
  end
  def init
    if session[:superadmin].nil?
      redirect_to login_admin_score_user_index_url
    end
  end
end