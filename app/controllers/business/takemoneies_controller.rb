# To change this template, choose Tools | Templates
# and open the template in the editor.

class Business::TakemoneiesController<BusinessController
    def new
      @bill = Takemoney.new
    end
    def create
      @bill = Takemoney.new(params[:takemoney])
      if @bill.save
        render :js=>"respond(提款已递交成功，请注意，我们会在2个工作日内进行电话确认！)"
      else
        render :js=>"respond(出错了，请稍候再进行该操作)"
      end
    end
end
