class MsgsController < ApplicationController
  # GET /msgs
  # GET /msgs.xml
  def index
    @msgs = Category[:news]
  end

  # GET /msgs/1
  # GET /msgs/1.xml
  def show
    @msg = Msg.find(params[:id])
  end

end
