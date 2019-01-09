class InvitesWarpController < WarpCable::Controller
    def index(params)
        Invite.after_create do
            yield Invite.all
        end
        Invite.after_update do
            yield Invite.all
        end
        Invite.after_destroy do
            yield Invite.all
        end
        yield Invite.all
    end

    def show(params)
        Invite.after_update do | invite |
            if(params[:id] == invite.id)
                yield Invite.find(params[:id])
            end
        end
        yield Invite.find(params[:id])
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
        params.permit(:meal_id, :sender_id, :receiver_id, :status)
    end

end