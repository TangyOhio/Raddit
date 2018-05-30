class TopicsController < ApplicationController
  before_action :find_sub
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = @sub.topics
  end

  def show
  end

  def new
    @topic = @sub.topics.new
    render partial: "form"
  end

  def create
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      redirect_to [@sub, @topic]
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @topic.update(topic_params)
      redirect_to [@sub, @topic]
    else
      render :edit
    end
  end

  def destroy
    @topic.delete
    redirect_to sub_topics_path
  end

  private

  def find_sub
    @sub = Sub.find(params[:sub_id])
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :body)
  end

end