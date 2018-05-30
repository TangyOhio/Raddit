class CommentsController < ApplicationController
  before_action :find_topic
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = @topic.comments.new(comment_params)
    if @comment.save
      redirect_to sub_topic_path(@topic.sub_id, @topic)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author)
  end

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
end
