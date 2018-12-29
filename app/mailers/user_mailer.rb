class UserMailer < ApplicationMailer

 
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end
  
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def sales_report(user)
    @user = user
    mail to: user.email, subject: "Sales report"
  end

 
end
