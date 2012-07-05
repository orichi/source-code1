module ApplicationHelper

  def current_user
    User.find(session[:user_id]) unless session[:user_id].blank?
  end

  def current_customer
    Customer.find(session[:customer_id]) unless session[:customer_id].blank?
  end

  def customer_login?
    !current_customer.blank?
  end

  def current_business
    Business.find(session[:business_id]) unless session[:business_id].blank?
  end

  def business_login?
    !current_business.blank?
  end

  def back_button
    raw '<input type="button" value="返回" onclick="window.history.back()"/>'
  end

  def link_button(value, link_to)
    raw "<input type='button' value='#{value}' onclick='window.location = \"#{link_to}\"'/>"
  end

  def required
    raw  "<span class='red'>*</span>"
  end

 def distance_between(start_date, end_date)
    difference = end_date.to_i - start_date.to_i
    seconds    =  difference % 60
    difference = (difference - seconds) / 60
    minutes    =  difference % 60
    difference = (difference - minutes) / 60
    hours      =  difference % 24
    difference = (difference - hours)   / 24
    days       =  difference % 7
    weeks      = (difference - days)    /  7

    return "#{days}天#{hours}小时#{minutes}分钟#{seconds}秒"
  end
end
