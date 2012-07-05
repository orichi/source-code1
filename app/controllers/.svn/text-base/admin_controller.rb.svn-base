class AdminController < ApplicationController
  before_filter :login_required

  private
  def login_required
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "请登录"
      redirect_to new_session_path
    end
  end
end
