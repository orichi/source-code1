class BusinessController < ApplicationController
  layout "business"
  before_filter :login_required
  before_filter :init_business

  private
  
  def login_required
    unless Business.find_by_id(session[:business_id])
      flash[:notice] = "请登录"
      redirect_to new_business_session_path
    end
  end
  
  def init_business
    @current_business = Business.find(session[:business_id])
  end
end
