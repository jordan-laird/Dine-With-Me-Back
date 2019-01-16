class MealsWarpController < ApplicationController
    def index(params)
        Meal.after_create do
            yield json: Meal.all
        end
        Meal.after_update do
            yield json: Meal.all
        end
        Meal.after_destroy do
            yield json: Meal.all
        end
        yield json: Meal.all
    end

    def show(params)
        Meal.after_update do | meal |
            if(params[:id].to_i == meal.id.to_i)
                yield json: Meal.find(params[:id])
            end
        end
        yield json: Meal.find(params[:id])
    end

    def create(params)
        Meal.create(meal_params)
    end

    def destroy(params)
        Meal.destroy(params[:id])
    end

    def update(params)
        meal = Meal.find(params[:id])
        meal.update(meal_params)
    end

    def meal_params
        params.permit(:starts_at, :restaurant_name, :restaurant_phone, :restaurant_address, :restaurant_lat, :restaurant_lng )
    end

end