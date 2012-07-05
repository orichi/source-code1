class Admin::CustomersController < AdminController
  before_filter :init_customer, :only => [:show, :destroy]

  def index
    @customers = Customer.all.paginate(:page => params[:page],:per_page => 2)
  end
  
  private
  def init_customer
    @customer = Customer.find(params[:id])
  end
end
