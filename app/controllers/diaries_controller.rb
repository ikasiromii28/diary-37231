class DiariesController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :image, :text, :todays_mood_id,
       :todays_weather_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
