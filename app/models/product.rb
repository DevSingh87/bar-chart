class Product < ActiveRecord::Base
	has_many :likes
	has_many :liked_by, through: :likes, source: :user

 def self.get_total_like_per_product
  	likes = Product.joins('LEFT JOIN likes ON products.id=likes.product_id')
  	likes = likes.select("products.id, products.name, COUNT(likes.product_id) AS countlike")
  	likes = likes.where("DATE(likes.created_at) = ? ", Date.today)
  	likes = likes.group("products.id, DATE(likes.created_at)")
  end
end
