class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 1:N の「1」側にあたるモデルに、has_many を記載する必要がある
  #dependent: :destroyは、「1:Nの1側が削除されたとき、N側を全て削除する」という機能
  has_many :post_images, dependent: :destroy
end


# Userモデルで表される1人のユーザに対して複数個（N 個・決まっていない数、0個以上）のPostImage モデルを関連付けることができます。
#言い換えると、1人のユーザーが、N個投稿することができる、という状況です。データベースではこれを、1対Nの関係と呼びます。

#このような 1:N の関係は、Rails のルールに従ってモデル内に記載することでモデル間の関係性を機能として持たせることができます。
#Railsではこの機能を、「アソシエーション（関連付け）」と呼んでいます。

#