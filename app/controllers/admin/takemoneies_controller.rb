# To change this template, choose Tools | Templates
# and open the template in the editor.

class Admin::TakemoneiesController < AdminController
    def index
      @bills = Takemoney.order("id desc").all
    end
    def show
    end
    def edit
    end
    def update
      if @bill.update_attributes(params[:takemoney])
        flash[:notice]="更新成功"
        redirect_to admin_takemoneies_path
      else
        render :edit
      end
    end



    private

    def init
      @bill = Takemoney.find(params[:id])
    end
end
