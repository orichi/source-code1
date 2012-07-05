class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    order_option = Biz_oreders[params[:order]] || Biz_oreders["default"]
    @buses = Business.flat_in_category(params[:id]).order(order_option).paginate(:page => params[:page],:per_page => 20)
  end

  def children_select
    @select_cate = Category.find(params[:select_id]) unless params[:select_id].blank?
    @cate_children = Category.find(params[:id]).children unless params[:id].blank?

    render :partial => "children_select"
  end
  
end
