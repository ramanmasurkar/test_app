desc "touch all updated_at columns for all the posts"
task :touch_updated_at_for_posts => :environment do
  post_runner = PostRunner.new
  post_runner.run
end