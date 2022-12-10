class PostImage < ApplicationRecord
  # PostImageモデルにActiveStorageを使い画像を持たせる
  has_one_attached :image

  # has_many とは逆に、1:N の「N」側にあたるモデルに、belongs_to を記載する必要があります。
  # "belongs to〜"とは、直訳すると「〜に属する」という意味
  belongs_to :user

end
