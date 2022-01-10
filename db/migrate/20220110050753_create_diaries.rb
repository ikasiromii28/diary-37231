class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string     :title             ,null: false
      t.text       :text              ,null: false
      t.integer    :todays_mood_id
      t.integer    :todays_weather_id
      t.references :user              ,null: false
      t.timestamps
    end
  end
end
