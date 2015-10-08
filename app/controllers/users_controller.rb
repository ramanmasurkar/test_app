class UsersController < ApplicationController
  def index
    binding.pry
    respond_to do |format|
      format.html
      format.json do
        @users, @count = User.index params
      end
    end
  end
end
