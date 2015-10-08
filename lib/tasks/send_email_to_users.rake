desc "send email to users"
task :send_email_to_users => :environment do
  User.all.each do |user|
    if UserMailer.welcome_email(user).deliver
      puts "sent email to #{user.email}"
    end
  end
end