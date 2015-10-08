class AddUser
  def initialize
  end
  def run
    ["raman.masurkar@wwindia.com", "santosh.singh@wwindia.com", "amit.sharma@wwindia.com"].each do |user_email|
      user = User.new(email: user_email)
      user.save
      puts "record created"
    end
  end
end