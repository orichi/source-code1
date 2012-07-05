class CustomersController < ApplicationController
  def new
    @customer = Customer.new
    render :layout => "simple"
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.randkey = rand_filename(15)
      if @customer.save
      session[:customer_id] = @customer.id
      UserMailer.welcome_email(@customer).deliver
      render :action => "success", :notice => '注册成功！'
    else
      render :action => "new", :layout => "simple"
    end
  end
  def active
    @customer = params[:id]
    key = params[:randkey]
    if key== @customer.randkey
      flash[:notice] = "激活成功"
      @customer.update_attribute(:active,true)
      redirect_to root_url
    else
      flash[:notice]= "激活失败"
      redirect_to new_customer_path
    end
  end

  private
  def rand_filename( len )
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end
end
