class MessagesWarpController < ApplicationController
    def index(params)
        Message.after_create do
            yield json: Message.all
        end
        Message.after_update do
            yield json: Message.all
        end
        Message.after_destroy do
            yield json: Message.all
        end
        yield json: Message.all
    end

    def show(params)
        Message.after_update do | message |
            if(params[:id] == message.id)
                yield json: Message.find(params[:id])
            end
        end
        yield json: Message.find(params[:id])
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