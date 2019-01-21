class MessagesWarpController < ApplicationController
    def index(params)

        # Message.after_create do
        #     message_array = Message.all.select{ |message| message["sender_id"].to_i == 1 || message["receiver_id"].to_i == 1 }
        #     yield json: message_array
        # end
        # Message.after_update do
        #     message_array = Message.all.select{ |message| message["sender_id"].to_i == 1 || message["receiver_id"].to_i == 1 }
        #     yield json: message_array
        # end
        # Message.after_destroy do
        #     message_array = Message.all.select{ |message| message["sender_id"].to_i == 1 || message["receiver_id"].to_i == 1 }
        #     yield json: message_array
        # end
        # message_array = Message.all.select{ |message| message["sender_id"].to_i == 1 || message["receiver_id"].to_i == 1 }
        #     yield json: message_array

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
            if(params[:id].to_i == message.id.to_i)
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
        params.permit(:sender_id, :receiver_id, :unread, :message)
    end

end