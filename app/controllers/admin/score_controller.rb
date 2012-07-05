class Admin::ScoreController < AdminController
  def index
    redirect_to :login
  end
  def login

  end
  def superadmin
    @user = params[:superpasswd]
    @useradmin = User.find(session[:user_id])
    if @user.superpasswd == @user.superpasswd
      session[:superadmin] = 1
      redirect_to login_admin_score_busscores_path
    else
      render :login
    end
  end

end
