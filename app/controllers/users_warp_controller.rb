class UsersWarpController < ApplicationController
    def index(params)
        User.after_create do
            yield User.all
        end
        User.after_update do
            yield User.all
        end
        User.after_destroy do
            yield User.all
        end
        yield User.all
    end

    def show(params)
        User.after_update do | user |
            if(params[:id] == user.id)
                yield User.find(params[:id])
            end
        end
        yield User.find(params[:id])
    end

    def create(params)
        User.create(user_params)
    end

    def destroy(params)
        User.destroy(params[:id])
    end

    def update(params)
        user = User.find(params[:id])
        user.update(user_params)
    end

    def user_params
        params.permit(:first_name,:last_name,:email,:password)
    end

end