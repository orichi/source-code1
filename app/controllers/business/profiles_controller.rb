class Business::ProfilesController < BusinessController
  
  def edit
    @business = @current_business
  end

  def update
    @business = @current_business
    if @business.update_attributes(params[:business])
      redirect_to(business_profile_path, :notice => '保存成功！')
    else
      render :action => "edit"
    end
  end

  def exchange
    @business = @current_business
    money = params[:money].to_f
    if money <= 0 || money > @business.balance
      render :js => "done_exchange(false);"
    else
      @business.balance = @business.balance - money
      @business.score = @business.score + money * 100 / 11
      @business.save
      render :js => "done_exchange(true);"
    end
  end
end
