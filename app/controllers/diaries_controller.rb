class DiariesController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    Diary.create(diary_params)
    #@diary = Diary.new(diary_params)
    # @diary = Diary.find_by(id: params[:id])
    # @user = User.find_by(id: @diary.user_id)
    #  if @diary.save
    #    redirect_to root_path
    #  else
    #    render :new
    #  end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :text, :todays_mood_id,
       :todays_weather_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
