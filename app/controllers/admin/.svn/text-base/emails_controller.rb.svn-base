class Admin::EmailsController < AdminController
  

  def index
    
  end
  def create
    @users = params[:email_user]
    @subject = params[:title]
    @content = params[:content]
    @users.each do |user|
      UserMailer.send_email(user,@content,@subject).deliver
    end
    redirect_to(admin_emails_path)
  end
end
