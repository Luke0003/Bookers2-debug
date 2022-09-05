class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
    # フォローを作成
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
    # フォローを外す
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
