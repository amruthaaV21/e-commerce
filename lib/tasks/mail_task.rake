namespace :mail_task do

desc "Send email to users"

task :email_sender => :environment do 
    User.find_each do |user|
    UserMailer.sales_report(user).deliver
  end
end

end
