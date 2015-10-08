class PostRunner
  def initialize
  end
  def run
    puts "inside the run"
    puts "get all the posts"
    Post.all.each do |post|
      post.touch
      puts "updated updated_at column for id #{post.id}"
    end
    puts "completed the updation"
  end
end