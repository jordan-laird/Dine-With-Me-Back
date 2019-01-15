class ApplicationController < WarpCable::Controller
    # before_action :check_authentication
    
    def check_authentication
        if !logged_in_user
            raise  'Please log in.'
        end
    end

    def logged_in_user
        if params['Authorization']
            method, token = params['Authorization'].split(' ')
            begin
                
                payload, headers = JWT.decode(token, "my_apps_secret")
                
                current_user = User.find(payload['user_id'])
            rescue JWT::DecodeError
                nil
            end
        end
    end

end
