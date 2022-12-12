class UsersController < ApplicationController
  def show
    #「URLに記載されたIDを参考に、必要なUserモデルを取得する」処理
    @user = User.find(params[:id])
    # アソシエーションを持っているモデル同士の記述方法
    # 特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し@post_imagesに渡すという処理を行うことができます。
    # 全体の投稿ではなく、個人が投稿したもの全てを表示
    @post_images = @user.post_images
  end

  def edit
  end
end
