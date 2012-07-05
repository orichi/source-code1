class BusinessesController < ApplicationController

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(params[:business])
    @business.password = Utilities.rand_chars(8)
    if @business.save
      render "add_success"
    else
      render :action => "new"
    end
  end

  def show
    if session[:customer_id].blank?
      redirect_to new_customer_path
    else
      @business = Business.find(params[:id])
      @business.update_attribute(:focus_count, @business.focus_count + 1);
      @comment = @business.comments.new

      unless params[:cid].blank? and Integer(params[:cid]) != session[:customer_id].blank?? "0" : Customer.find(session[:customer_id]).id
        recommender = Customer.find(params[:cid])
        recommender.update_attribute(:score, recommender.score + 1)
        @business.update_attribute(:score, @business.score - 1)
      end
    end
  end

  def index
    order_option = Biz_oreders[params[:order]] || Biz_oreders["default"]
    @buses = Business.order(order_option).paginate(:page => params[:page],:per_page => 2)
  end
  
end
