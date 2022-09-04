class RelationshipsController < ApplicationController

  def create
    relationship = current_user.relationships.new(follower_id: current_user.id, followed_id: params[:user_id] )
    relationship.save
    redirect_to request.referer
    # フォローを作成
  end

  def destroy
    user = User.find(params[:user_id])
    relationship = user.relationships.find(followed_id: current_user.id)
    relationship.destroy
    redirect_to request.referer
    # フォローを外す
  end

end
