namespace :scheduler do

desc "Send email to users"

task :email_sender => :environment do |_, args|
  User.find_each do |user|
    UserMailer.sales_report(user).deliver
  end
end

end
