class ActivitiesController < ApplicationController
  before_filter :init_activity, :only => [:show]
  def index
    @activities = Activity.in_doings.paginate(:page => params[:page],:per_page => 2)
  end

  def show
  end

  private
  def init_activity
    @activity = Activity.find(params[:id])
  end

end
