class Business::VarietiesController < BusinessController
  before_filter :init_var, :only => [:edit, :destroy, :update]

  def create
    @variety = @current_business.varieties.new(params[:variety])
    @variety.save
    redirect_to business_subjects_path(:var_id => @variety)
  end

  def new
    @variety = @current_business.varieties.build
  end

  def update
    @variety.update_attributes(params[:variety])
    redirect_to business_subjects_path(:var_id => @variety)
  end

  def destroy
    @variety.destroy
    redirect_to business_subjects_path
  end

  private
  def init_var
    @variety = @current_business.varieties.find(params[:id])
  end

end
