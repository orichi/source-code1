class CustomerController < ApplicationController
  layout "customer"
  before_filter :login_required
  before_filter :init_customer

  private
  
  def login_required
    puts "******************#{Customer.find_by_id(session[:customer_id])}********************************"
    unless Customer.find_by_id(session[:customer_id])
      flash[:notice] = "请登录"
      flash[:refer_url] = request.env["HTTP_REFERER"]
      if(request.xhr?)
        render :js => "to_login_page();"
      else
        redirect_to new_customer_session_path
      end
    end
  end
  
  def init_customer
    @current_customer = Customer.find(session[:customer_id])
  end
end
