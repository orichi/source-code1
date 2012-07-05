class Customer::AttentionsController < CustomerController
  after_filter :calculate_score, :only => [:create]

  def index
    @businesses = @current_customer.businesses.paginate(:page => params[:page],:per_page => 2)
  end

  def create
    @business = Business.find(params[:business_id])
    @current_customer.businesses << @business
    render :js => "paid_attention(#{params[:business_id]})"
  end

  def calculate_score
    @business.score = @business.score - 1
    @current_customer.score = @current_customer.score + 1
    @business.save
    @current_customer.save
  end
end
