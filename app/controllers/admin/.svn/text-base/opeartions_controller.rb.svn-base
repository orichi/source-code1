class Admin::OpeartionsController < AdminController

  def index
    if (params[:type]&&params[:value] )
      @opeartions = Opeartion.seekrecord(params[:type],params[:value]).paginate(:page => params[:page],:per_page => 2)
    else
      @opeartions = Opeartion.order("id desc").find(:all).paginate(:page => params[:page],:per_page => 2)
    end
  end
  def show
    @opeartion = Opeartion.find(params[:id])
  end
  
end