class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.datetime :starts_at
      t.string :restaurant_name
      t.string :restaurant_phone
      t.string :restaurant_address
      t.float :restaurant_lat, default: 0
      t.float :restaurant_lng, default:0
      t.timestamps
    end
  end
end
