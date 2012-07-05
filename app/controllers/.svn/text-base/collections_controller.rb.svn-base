class CollectionsController < ApplicationController
  def show
    @collection = Collection.find(params[:id]);
    order_option = Biz_oreders[params[:order]] || Biz_oreders["default"]
    avg_filter = Biz_avgs[params[:avg]] || Biz_avgs["default"]
    @buses = @collection.businesses.where(:avg_consume => avg_filter).order(order_option).paginate(:page => params[:page],:per_page => 20)
  end

end
