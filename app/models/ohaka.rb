class Ohaka < ActiveRecord::Base
  validates :name, presence: true
  # 画像の追加
  mount_uploader :image, ImageUploader
end
