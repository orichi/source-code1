class CustomerSessionsController < ApplicationController
  layout "simple"

  def create
    authed = Customer.auth(params[:customer_email], params[:password])
    if authed
      if authed.actives == false
        flash[:notice] = "请先激活您的账户，然后进行其他操作"
        redirect_to root_path
      end
      session[:customer_id] = authed.id
      refer_url = flash[:refer_url]
      unless(refer_url.blank?)
        redirect_to refer_url
      else
        redirect_to root_path
      end
      
    else
      flash[:notice] = "Email或密码不正确"
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to  root_path
  end

end
