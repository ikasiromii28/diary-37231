class Diary < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :title
    validates :text
    validates :todays_mood, numericality: { other_than: 1, message: "can't be blank" }
    validates :todays_weather, numericality: { other_than: 1, message: "can't be blank" }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :todays_mood
  belongs_to :todays_weather
end
