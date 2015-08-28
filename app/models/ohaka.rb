class Ohaka < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  # 画像の追加
  mount_uploader :image, ImageUploader
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Ohaka.where(['name LIKE ?', "%#{search}%"])
    else
      Ohaka.all #全て表示。
    end
  end
end
