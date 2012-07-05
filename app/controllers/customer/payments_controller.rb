class Customer::PaymentsController < CustomerController
  def index
    @payments = Orderform.order("id desc").find_all_by_customer_id(session[:customer_id]).paginate(:page => params[:page],:per_page => 12)
  end
  def create
    if params[:subject_id].blank?
      flash[:notice]="请先登录"
      redirect_to new_customer_sessions_path
    else
      order = Orderform.new(:serial_no =>Time.now.strftime("%Y%m").to_s+("%04d" % (( Orderform.maximum(:id) || 0) + 1)).to_s,
        :customer_id => session[:customer_id],:paid=>false)
      params[:subject_id].each_index do |index|
        subject = Subject.find(params[:subject_id][index])
        quantity =  params[:quantity][index].to_i
        order.orderlines << Orderline.new(:subject_id => subject.id, 
          :subject_name => subject.name, :quantity =>quantity, :price =>  subject.price
        )
      end
      order.save
      order.totalmoney = order.total
      order.update_attribute(:totalmoney,order.total)
      session[:cart]= nil
      redirect_to confirm_customer_payment_path(order)
    end
  end
  def confirm
    @order = Orderform.find(params[:id])
  end
  def pay
    @order = Orderform.find(params[:id])
    if params[:type].to_s == "1"
      @customer = Customer.find(session[:customer_id])
      if @customer.score < @order.totalmoney.to_i
        flash[:notice]= "积分不足，无法支付，请使用其他支付方式"
      else
        @customer.score = @customer.score - @order.totalmoney*10.to_i
        @customer.save
        @order.update_attributes(:paid=>true,:paidmoney=>@order.totalmoney,:paid_at=>Time.now)
        flash[:notice]="支付成功"
        session[:cart] = nil if session[:cart].nil?
        redirect_to customer_payments_path
      end
    else
      if params[:type].to_s == "2"
        #      flash[:notice]="网站建设中..."
        redirect_to(Alipay.pay_to do |paras_hash|
            paras_hash["price"] = (@order.totalmoney).to_s
            paras_hash["quantity"] = 1.to_s
            paras_hash["body"] = "豆豆聚会订单：单号"+@order.serial_no.to_s+"总金额："+@order.totalmoney.to_s
            paras_hash["out_trade_no"] = @order.serial_no
            paras_hash["logistics_fee"] = "0"
            paras_hash["subject"] = "豆豆聚会订单"
            #        paras_hash["total_fee"] = (@order.total(:cn).round(2)+ @order.shippingfee.round(2)).to_s+"0"
            paras_hash["return_url"] = (return_back_customer_alipyment_url)
            #{return_back_alipayment_url(@order.id)    return_back_alipayment_url(@order.id)    notify_alipayment_url(@order.id)
            paras_hash["show_url"] = (customer_payment_path(@order))
            paras_hash["notify_url"] = (notify_customer_alipyment_url)
          end)
      end
    end
  end
  def destroy
    @payment = Orderform.find(params[:id])
    @payment.destroy
    redirect_to customer_payments_url
  end
end
