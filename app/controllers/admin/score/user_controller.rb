class Admin::Score::UserController < AdminController
  def login

  end
  def slogin
    user = params[:password]
    if user == User.find(session[:user_id]).superpasswd
      flash[:notice]="登录成功"
      session[:superadmin]="1"
      redirect_to admin_score_busscores_path
    else
      redirect_to login_admin_score_user_index_path
    end
  end
  def logout
    session[:superadmin]=nil
    flash[:notice]="已退出"
    redirect_to login_admin_score_user_index_path
  end
end