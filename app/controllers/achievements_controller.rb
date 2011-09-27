class AchievementsController < ApplicationController
  before_filter :require_authentication, :except => :show

  def index
    @achievements = Achievement.all
  end

  def show
    @achievement = Achievement.find params[:id]
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new params[:achievement]
    if @achievement.save
      redirect_to achievement_url(@achievement)
    else
      render :new
    end
  end
end
