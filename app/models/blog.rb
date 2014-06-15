class Blog < ActiveRecord::Base
  validates :title, length: {:in => 2..50},presence:true
  validates :slug_url,length: {:in => 1..50},presence: true,uniqueness: {case_sensitive: false}
  validates :context, length: {:in => 3..16777215},presence:true
  belongs_to :category
  mount_uploader :thumb, PhotoUploader


end