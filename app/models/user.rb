class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include Datatable
  def is_admin?
    ADMIN_EMAILS.include?(email)
  end

  def self.index params
    @params = params
    @col = %w[id email]
    if params[:search].present?
      users = User.where("cast(id as char(2)) ilike :search or email ilike :search",search: "%#{params[:search]}%")
    else
      users = User.all
    end
      count = users.size
      [users.page(pages).per(per_page).order("#{sort_column} #{sort_direction}"), count]
  end
end
