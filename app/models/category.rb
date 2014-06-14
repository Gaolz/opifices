class Category < ActiveRecord::Base
  validates :name,length: {:in => 2..20},uniqueness: {case_sensitive: false},presence: true
  validate  :desc,length: {:in => 2..50}
  before_destroy :reset_blogs_category
  has_many :blogs

  def reset_blogs_category #分类删除前，将相关blog的所属分类设置为空
    self.blogs.update_all(category_id: nil)
  end

end
