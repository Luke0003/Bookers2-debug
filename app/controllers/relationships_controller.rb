class RelationshipsController < ApplicationController

  def create

    user = User.find(params[:user_id])
    relationship = current_user.relationships.new(follower_id: user.id)
    relationship.save
    redirect_to request.referer
    # フォローを作成
  end

  def destroy
    user = User.find(params[:user_id])
    relationship = current_user.relationships.find(follower_id: user.id)
    relationship.destroy
    redirect_to request.referer
    # フォローを外す
  end

end
