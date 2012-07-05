class Customer::AlipaymentsController < CustomerController
  def notify
    @orderform = Orderform.find_by_serial_no(params[:out_trade_no])
    @orderform.orderlines.each{ |x| x.product.buytime = x.product.buytime+1}
    trade_status = params[:trade_status]   #获取新的交易状态
    if !@order.paid?
      @orderform.update_attributes(:paid => true, :paid_at => Time.now) if trade_status == "TRADE_SUCCESS"
      render :text => "success", :layout => false
    else
      render :text => "failed", :layout => false
    end
  end

  def return_back
    @host = request.remote_ip.to_s
    trade_status = params[:trade_status]   #获取新的交易状态
    @order = Orderform.find_by_serial_no(params[:out_trade_no])
    if trade_status == "TRADE_SUCCESS" #orderform status update
      if !@order.paid?
        @order.update_attributes(:paid => true, :paid_at => Time.now)
        flash[:notice] = "支付成功"
      else
        flash[:notice] = "订单同步/更新失败"
      end
      render :layout =>"simple"
    end
  end
end
