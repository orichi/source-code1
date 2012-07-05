class CartsController < ApplicationController
  before_filter :init_cart, :only => [:show, :success_tip, :create, :overview]

  def create
    subject = Subject.find(params[:subject_id])
    session[:cart].add(subject.business.id, subject.id, params[:quantity])
    render :js => "add_shopping_cart_tip()"
  end

  def index
    @items = session[:cart].nil? ? "" : session[:cart].bizs
  end
  def success_tip
    render :layout => false;
  end
  def remove_item
    sessions[:cart].bizs.select{|biz| biz == params[:biz_id]}.first(1).remove(params[:subject_id])
  end
  def update
    sessions[:cart].bizs.select{|biz| biz == params[:biz_id]}.first(1).update(params[:subject_id],params[:quantity])
  end
  def overview
    render :layout => false;
  end

  private
  def init_cart
    session[:cart] = Cart.new if session[:cart].blank?
    @cart = session[:cart]
  end
end
