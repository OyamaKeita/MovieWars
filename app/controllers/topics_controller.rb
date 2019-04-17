class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
    @user = User.find(session[:user_id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿できませんでした'
      render :new
end
end

def destroy
  @topic = Topic.find_by(id: params[:topic_id])
  @topic.destroy
  redirect_to topics_path, danger: '投稿を削除しました'
end

private
def topic_params
  params.require(:topic).permit(:image, :description, :title)
end
end
