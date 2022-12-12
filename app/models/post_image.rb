class PostImage < ApplicationRecord
  # PostImageモデルにActiveStorageを使い画像を持たせる
  has_one_attached :image

  # has_many とは逆に、1:N の「N」側にあたるモデルに、belongs_to を記載する必要があります。
  # "belongs to〜"とは、直訳すると「〜に属する」という意味
  belongs_to :user

  # no_image.jpgをActiveStorageに格納するためにコード
  # このメソッドの内容は、画像が設定されない場合はapp/assets/imagesに格納
  # no_image.jpgという画像をデフォルト画像としてActiveStorageに格納し、格納した画像を表示する
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/Meshiterro/no_image.jpg')
      image.attached(io: File.open(file_path),filename: 'defaurt-image.jpg',content_type: 'image/jpeg')
    else
      image
    end
  end

end
