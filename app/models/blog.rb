class Blog < ActiveRecord::Base
  validates :title, length: {:in => 2..50},presence:true
  validates :slug_url,length: {:in => 1..50},uniqueness: {case_sensitive: false}
  validates :context, length: {:in => 3..16777215},presence:true
  before_validation :clean_slug
  before_save :fill_slug
  belongs_to :category
  mount_uploader :thumb, PhotoUploader

  def clean_slug #过滤slug中的无效字符
    self.slug_url = self.slug_url.gsub(/[^a-zA-Z\-0-9]/, '-').downcase if self.slug_url.present?
  end

  def fill_slug   # 如果没有slug则用id代替
  self.slug_url = self.id if self.slug_url.blank?
  end

end