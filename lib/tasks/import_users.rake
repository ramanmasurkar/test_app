desc "Import users email"
task :import_users_email => :environment do
  require 'smarter_csv'
  puts "get all data from csv file"
  users_email_all = SmarterCSV.process Rails.root.join('sample.csv')
  users_email_all.each do |users_email|
    user = User.new
    user.email = users_email
    user.save
    puts "user created"
  end
end