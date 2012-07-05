class UserMailer < ActionMailer::Base
  default :from => "wang2365@126.com"

  def welcome_email(user)
    @user = user
    @url  = "http://jikeel.com/customer/new"
    mail(:to => user.email,
      :subject => "Welcome to My Awesome Site")
  end

  def send_email(usr,content,title)
    @user = usr
    @content = content
    @subject= title
    mail(:to=>"xingchenyueliang@163.com",
      :subject=>@subject
      )
  end

  def receive(email)
    page = Page.find_by_address(email.to.first)
    page.emails.create(
      :subject => email.subject,
      :body => email.body
    )

    if email.has_attachments?
      for attachment in email.attachments
        page.attachments.create({
            :file => attachment,
            :description => email.subject
          })
      end
    end
  end
end
