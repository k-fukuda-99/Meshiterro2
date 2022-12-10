class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    #投稿するデータを PostImage モデルに紐づくデータとして保存する準備をしていてフォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納されることになっています。
    @post_image = PostImage.new(post_image_params)
    #@post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる。
    @post_image.user_id = current_user.id
    #データを保存する
    @post_image.save
    #リダイレクト先は投稿一覧画面
    redirect_to post_images_path
  end

  def index
  end

  def show
  end

  private

  # post_image_paramsメソッドでは、フォームで入力されたデータが、投稿データとして許可されているパラメータかどうかをチェックしています。
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
