class Admin::Score::BusscoresController < AdminController
  before_filter :init,:only=>[:index,:edit,:update]
  def index
    @busscores = Business.order("id desc").all.paginate(:page => params[:page],:per_page => 2)
  end
  def edit
    @busscore = Business.find(params[:id])
  end
  def update
    @busscore = Business.find(params[:id])
    if @busscore.update_attributes(params[:business])
      redirect_to admin_score_busscores_path
    end
  end
  def init
    if session[:superadmin].nil?
      redirect_to login_admin_score_user_index_url
    end
  end
end