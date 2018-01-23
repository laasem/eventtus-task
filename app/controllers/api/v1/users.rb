module API  
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc "Return all users"
        get "", root: :users do
          users = User.all
          present users, with: API::Entities::User
        end

        desc "Return a user"
        params do
          requires :id, type: String, desc: "ID of the 
            user"
        end
        get ":id", root: "user" do
          user = User.where(id: permitted_params[:id]).first!
          present user, with: API::Entities::User
        end

        desc "Create a user"
        params do
          requires :all, except: [:id], using: API::Entities::User.documentation.except(:id)
        end
        post "", root: :users do
          user = User.create! params
          present user, with: API::Entities::User
        end

        desc "Modify a user"
        params do
          requires :id, type: String, desc: "ID of the 
            user"
        end
        patch ":id", root: "user" do
          user = User.find_by id: params[:id]
          user.update params
          present user, with: API::Entities::User
        end

        # # Figure out how all works and fix
        # desc "Replace a user"
        # params do
        #   requires :all
        # end
        # put ":id", root: "user" do
        #   user = User.find_by id: params[:id]
        #   user.update params
        #   present user, with: API::Entities::User
        # end

        desc "Delete a user"
        params do
          requires :id, type: String, desc: "ID of the 
            user"
        end
        delete ":id", root: "user" do
          user = User.find_by id: params[:id]
          user.destroy
        end
      end
    end
  end
end  