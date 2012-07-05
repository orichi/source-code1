class Customer::ProfilesController < CustomerController

  def edit
    @customer = @current_customer
  end

  def update
    @customer = @current_customer
    if @customer.update_attributes(params[:customer])
      redirect_to(edit_customer_profile_path, :notice => '保存成功！')
    else
      render :action => "edit"
    end
  end
  
end
