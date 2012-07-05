class Customer::PartakesController < CustomerController

  def index
    @activities = @current_customer.activities.paginate(:page => params[:page],:per_page => 2)
  end
  
  def create
    @activity = Activity.find(params[:activity_id])
    @activity.customers << @current_customer
    @acorder = ActivityOrder.new(:serial_no=>("%09d"%((ActivityOrder.maximum(:id) || 0) + 1)).to_s,:customer_id=>@current_customer,:activity_id=>@activity,
      :created_at=>Time.now,:totalmoney=>@activity.price,:paid=>false)
    @acorder.save
    redirect_to bill_customer_partake_path
  end
  def add
    #    @activity = Activity.find(params[:activity_id])
    #    @activity.customers<< Customer.find(session[:customer_id])
    #    @activity.save
    @order = ActivityOrder.new(:serial_no =>Time.now.strftime("%m").to_s+("%08d" % (( ActivityOrder.maximum(:id) || 0) + 1)).to_s,
      :customer_id => session[:customer_id],:paid=>false,:activity_id=>params[:activity_id],:totalmoney=>Activity.find(params[:activity_id]).current_price)
    @order.save
    render(:file=>"customer/partakes/pay.html")
  end
  def pay
    @order = ActivityOrder.find(params[:id])
    @acc= Activity.find(@order.activity_id)
    @order.paidmoney = @order.totalmoney * (@acc.discount_rules.empty? ? "1" :(@acc.discount_rules.first.percent)/100)
    if params[:type].to_s == "1"
      @customer = Customer.find(session[:customer_id])
      if @customer.score < @order.paidmoney.to_i
        flash[:notice]= "积分不足，无法支付，请使用其他支付方式"
      else
        @customer.score = @customer.score - @order.totalmoney*10.to_i
        @customer.save
        @order.update_attributes(:paid=>true,:paidmoney=>@order.totalmoney,:paid_at=>Time.now)
        flash[:notice]="支付成功"
        session[:cart] = nil if session[:cart].nil?
        redirect_to bill_customer_partakes_path
      end
    else
      if params[:type].to_s == "2"
        #      flash[:notice]="网站建设中..."
        redirect_to(Alipay.pay_to do |paras_hash|
            paras_hash["price"] = (@order.totalmoney).to_s
            paras_hash["quantity"] = 1.to_s
            paras_hash["body"] = "豆豆聚会团购订单：单号"+@order.serial_no.to_s+"总金额："+@order.totalmoney.to_s
            paras_hash["out_trade_no"] = @order.serial_no.to_s
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
  def bill
    @payments = ActivityOrder.order("id desc").find_all_by_customer_id(session[:customer_id]).paginate(:page => params[:page],:per_page => 12)
  end
end
