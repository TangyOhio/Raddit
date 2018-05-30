class SubsController < ApplicationController
  before_action :find_sub, only: [:show, :edit, :update, :destroy]
  after_action :more_cowbell


  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render partial: "form"
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to @sub
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @sub.update(sub_params)
      redirect_to @sub
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private

  def find_sub
    @sub = Sub.find(params[:id])
  end

  def more_cowbell
    Rails.logger.info "DING DING DING DING"
  end

  def sub_params
    params.require(:sub).permit(:name)
  end
end
