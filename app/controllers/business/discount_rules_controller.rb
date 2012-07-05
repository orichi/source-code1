class Business::DiscountRulesController < BusinessController
  layout false
  before_filter :init_rule
  
  def index
    @rules = @activity.discount_rules
  end

  def create
    @activity.discount_rules << DiscountRule.new(params[:discount_rule])
    render :js => "load_rules();load_new_rule();"
  end

  def edit
    @rule = @activity.discount_rules.find(params[:id])
  end

  def update
    discount_rule = @activity.discount_rules.find(params[:id])
    discount_rule.update_attributes(params[:discount_rule])
    render :js => "load_rules();load_new_rule();"
  end

  def new
    @rule = @activity.discount_rules.build
  end

  def destroy
    @rule = @activity.discount_rules.find(params[:id])
    @rule.destroy
    render :js => "load_rules()"
  end

  private
  def init_rule
    @activity = Activity.find(params[:activity_id])
  end
end
