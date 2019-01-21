class InvitesWarpController < ApplicationController
    def index(params)
        # Invite.after_create do
        #     invite_array = Invite.all.select{ |invite| invite["sender_id"].to_i == params[:userID].to_i || invite["receiver_id"].to_i == params[:userID].to_i }
        #     yield json: invite_array
        # end
        # Invite.after_update do
        #     invite_array = Invite.all.select{ |invite| invite["sender_id"].to_i == params[:userID].to_i || invite["receiver_id"].to_i == params[:userID].to_i }
        #     yield json: invite_array
        # end
        # Invite.after_destroy do
        #     invite_array = Invite.all.select{ |invite| invite["sender_id"].to_i == params[:userID].to_i || invite["receiver_id"].to_i == params[:userID].to_i }
        #     yield json: invite_array
        # end
        # invite_array = Invite.all.select{ |invite| invite["sender_id"].to_i == params[:userID].to_i || invite["receiver_id"].to_i == params[:userID].to_i }
        #     yield json: invite_array
        Invite.after_create do
            yield json: Invite.all
        end
        Invite.after_update do
            yield json: Invite.all
        end
        Invite.after_destroy do
            yield json: Invite.all
        end
        yield json: Invite.all
    end

    def show(params)
        Invite.after_update do | invite |
            if(params[:id].to_i == invite.id.to_i)
                yield json: Invite.find(params[:id])
            end
        end
        yield json: Invite.find(params[:id])
    end

    def create(params)
        Invite.create(invite_params)
    end

    def destroy(params)
        Invite.destroy(params[:id])
    end

    def update(params)
        invite = Invite.find(params[:id])
        invite.update(invite_params)
    end

    def invite_params
        params.permit(:meal_id, :sender_id, :receiver_id, :status )
    end

end