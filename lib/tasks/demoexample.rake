  # desc "Export message and property id"
  # task :export_allowed_contacts => :environment do

  # end


desc "Set reviewed as true for all posts"
task :set_reviewed_as_true => :environment do
  puts "Get all non-reviewed posts"
  Post.where(reviewed: nil).each do |post|
    post.reviewed = true
    post.save!
    puts "updated post id #{post.id} "
  end
end
