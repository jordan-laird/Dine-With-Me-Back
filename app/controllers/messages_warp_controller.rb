class MessagesWarpController < ApplicationController
    def index(params)
        Message.after_create do
            message_array = Message.all.select{ |message| message["sender_id"].to_i == params[:userID].to_i || message["receiver_id"].to_i == params[:userID].to_i }
            yield json: message_array
        end
        Message.after_update do
            message_array = Message.all.select{ |message| message["sender_id"].to_i == params[:userID].to_i || message["receiver_id"].to_i == params[:userID].to_i }
            yield json: message_array
        end
        Message.after_destroy do
            message_array = Message.all.select{ |message| message["sender_id"].to_i == params[:userID].to_i || message["receiver_id"].to_i == params[:userID].to_i }
            yield json: message_array
        end
        message_array = Message.all.select{ |message| message["sender_id"].to_i == params[:userID].to_i || message["receiver_id"].to_i == params[:userID].to_i }
            yield json: message_array
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
        params.permit(:sender, :receiver, :unread)
    end

end