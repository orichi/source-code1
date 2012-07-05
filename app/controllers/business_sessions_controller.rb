class BusinessSessionsController < ApplicationController
  layout "simple"
  def create
    authed = Business.auth(params[:biz_name], params[:password])
    if authed
      session[:business_id] = authed.id
      redirect_to business_dashboard_path
    else
      flash[:notice] = "用户名或密码不正确"
      render :new
    end
  end

  def destroy
    session[:business_id] = nil
    redirect_to business_dashboard_path
  end
end