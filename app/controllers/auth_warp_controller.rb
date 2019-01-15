class AuthWarpController < ApplicationController

    def create(params)

        user = User.find_by(email: params[:email])
    
        if user && user.authenticate(params[:password])
            yield json: {
                token: JWT.encode({ user_id: user.id }, 'my_apps_secret'), 
                user: user,
            }
        else
            yield json: {
                error: 'username or password are incorrect'
            }
        end
    end

end