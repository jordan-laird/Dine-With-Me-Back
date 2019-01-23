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
        # byebug
        @meal = Meal.create!(meal_params)
        invite_parameters = invite_params
        invite_parameters["meal_id"] = @meal.id
        Invite.create!(invite_parameters)
        yield @meal
    end

    def destroy(params)
        Meal.destroy(params[:id])
    end

    def update(params)
        meal = Meal.find(params[:id])
        meal.update(meal_params)
    end

    def meal_params
        object = params.permit(:starts_at, :restaurant_name, :restaurant_phone, :restaurant_address, :restaurant_lat, :restaurant_lng )
        object[:starts_at] = DateTime.strptime(params["starts_at"], '%m-%d-%Y %I:%M %p')

        return object
    end

    def invite_params
        params.permit(:sender_id, :receiver_id, :status )
    end

end