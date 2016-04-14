class User < ActiveRecord::Base
	has_many :likes
	has_many :product_liked, through: :likes, source: :product

  def self.get_total_like_by_per_user
  	totallikes = User.joins('LEFT JOIN likes ON users.id=likes.user_id')
  	totallikes = totallikes.select("users.id, users.name, COUNT(likes.user_id) AS countlikedbyuser")
  	totallikes = totallikes.where("DATE(likes.created_at) = ? ", Date.today)
  	totallikes = totallikes.group("users.id, DATE(likes.created_at)")
  end
end
