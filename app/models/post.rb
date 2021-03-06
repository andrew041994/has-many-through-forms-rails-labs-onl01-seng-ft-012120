class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories


  def categories_attributes=(category_hash)
    category_hash.values.each do |value|
      if value["name"].present?
      category = Category.find_or_create_by(value)
      self.categories << category
      end
   end
    
  end

end
