class SessionsController < ApplicationController
  def new
  end

  def create
    authed = User.auth(params[:user_name], params[:password])
    if authed
      session[:user_id] = authed.id
      redirect_to  console_path
    else
      flash[:notice] = "用户名或密码不正确"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to  new_session_path
  end
end
