class Customer::FriendsController < CustomerController
  def index
    @payments = Orderform.find_all_by_customer_id(session[:user_id])
  end

end
