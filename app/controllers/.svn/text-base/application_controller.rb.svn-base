class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  Biz_oreders = {"default" => "id desc", "popular" => "focus_count desc", "comment" => "comments_count desc", "hot" => "level desc"}
  Biz_avgs = {"default" => 0...10000000, "0to20" => 0...20, "20to50" => 20...50, "50to100"=>50...100, "100above"=>100...10000000}
end
