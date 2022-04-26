class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    other_user = Micropost.find(params[:micropost_id]).user
    current_user.favorite(other_user)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to current_user
  end

  def destroy
    other_user = Micropost.find(params[:micropost_id]).user
    current_user.unfavorite(other_user)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_to current_user
  end
end
