class Ohaka < ActiveRecord::Base
  # 画像の追加
  mount_uploader :image, ImageUploader
end
