class CommentsController < ApplicationController
  after_filter :notify_customers, :only => [:create]
  after_filter :calculate_score, :only => [:create]

  def index
    @business = Business.find(params[:business_id])
    @comments = @business.comments.order("id desc").paginate(:page => params[:page],:per_page => 20)
  end

  def create
    @business = Business.find(params[:business_id])
    @comment = @business.comments.new(params[:comment])
    @comment.created_by = Customer.find(session[:customer_id])
    @comment.save
    redirect_to business_path(@business)
  end

  def notify_customers
    @business.customers.each do |customer|
      customer.notifications << Notification.new(:resource => @comment)
    end
  end

  def calculate_score
    @business.level = @business.calculate_level
    @business.score = @business.score - 1
    @business.save
    customer = Customer.find(session[:customer_id])
    customer.score = customer.score + 1
    customer.save
  end
end
