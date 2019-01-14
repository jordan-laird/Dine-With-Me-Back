class MessagesWarpController < ApplicationController
    def index(params)
        Message.after_create do
            yield Message.all
        end
        Message.after_update do
            yield Message.all
        end
        Message.after_destroy do
            yield Message.all
        end
        yield Message.all
    end

    def show(params)
        Message.after_update do | message |
            if(params[:id] == message.id)
                yield Message.find(params[:id])
            end
        end
        yield Message.find(params[:id])
    end

    def create(params)
        Message.create(message_params)
    end

    def destroy(params)
        Message.destroy(params[:id])
    end

    def update(params)
        message = Message.find(params[:id])
        message.update(message_params)
    end

    def message_params
        params.permit(:sender, :receiver, :unread)
    end

end