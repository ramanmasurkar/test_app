desc "add users"
task :add_users => :environment do
  add_user = AddUser.new
  add_user.run
end