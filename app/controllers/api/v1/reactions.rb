module API
  module V1
    class Reactions < Grape::API
      include API::V1::Defaults
      resource :posts do
        segment '/:post_id' do
          resource :reactions do
            desc "Return all reactions"
            get "", root: :reactions do
              reactions = Reaction.all
              present reactions, with: API::Entities::Reaction
            end

            desc "Return a reaction"
            params do
              requires :id, type: String, desc: "ID of the 
                reaction"
            end
            get ":id", root: "reaction" do
              reaction = Reaction.where(id: permitted_params[:id]).first!
              present reaction, with: API::Entities::Reaction
            end

            desc "Create a reaction"
            params do
              requires :all, except: [:id], using: API::Entities::Reaction.documentation.except(:id)
            end
            post "", root: :reactions do
              reaction = Reaction.create! params
              present reaction, with: API::Entities::Reaction
            end

            desc "Modify a reaction"
            params do
              requires :id, type: String, desc: "ID of the 
                user"
            end
            patch ":id", root: "reaction" do
              reaction = Reaction.find_by id: params[:id]
              reaction.update params
              present reaction, with: API::Entities::reaction
            end

            # # Figure out how all works and fix
            # desc "Replace a reaction"
            # params do
            #   requires :all
            # end
            # put ":id", root: "reaction" do
            #   reaction = Reaction.find_by id: params[:id]
            #   reaction.update params
            #   present reaction, with: API::Entities::Reaction
            # end

            desc "Delete a reaction"
            params do
              requires :id, type: String, desc: "ID of the 
                reaction"
            end
            delete ":id", root: "reaction" do
              reaction = Reaction.find_by id: params[:id]
              reaction.destroy
            end
          end
        end
      end
    end
  end
end  