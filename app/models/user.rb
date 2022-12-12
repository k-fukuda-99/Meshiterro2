class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 1:N の「1」側にあたるモデルに、has_many を記載する必要がある
  #dependent: :destroyは、「1:Nの1側が削除されたとき、N側を全て削除する」という機能
  has_many :post_images, dependent: :destroy

  # profile_imageという名前でActiveStorageでプロフィール画像を保存できるように設定
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/Meshiterro/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # この部分で画像サイズの変更を行っています。引数に設定した値に画像のサイズを変換。
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end


# Userモデルで表される1人のユーザに対して複数個（N 個・決まっていない数、0個以上）のPostImage モデルを関連付けることができます。
#言い換えると、1人のユーザーが、N個投稿することができる、という状況です。データベースではこれを、1対Nの関係と呼びます。

#このような 1:N の関係は、Rails のルールに従ってモデル内に記載することでモデル間の関係性を機能として持たせることができます。
#Railsではこの機能を、「アソシエーション（関連付け）」と呼んでいます。
