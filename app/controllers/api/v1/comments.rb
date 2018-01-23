module API
  module V1
    class Comments < Grape::API
      include API::V1::Defaults
      resource :posts do
        segment '/:post_id' do
          resource :comments do
            desc "Return all comments"
            get "", root: :comments do
              comments = Comment.all
              present comments, with: API::Entities::Comment
            end

            desc "Return a comment"
            params do
              requires :id, type: String, desc: "ID of the 
                comment"
            end
            get ":id", root: "comment" do
              comment = Comment.where(id: permitted_params[:id]).first!
              present comment, with: API::Entities::Comment
            end

            desc "Create a comment"
            params do
              requires :all, except: [:id], using: API::Entities::Comment.documentation.except(:id)
            end
            post "", root: :comments do
              comment = Comment.create! params
              present comment, with: API::Entities::Comment
            end

            desc "Modify a comment"
            params do
              requires :id, type: String, desc: "ID of the 
                user"
            end
            patch ":id", root: "comment" do
              comment = Comment.find_by id: params[:id]
              comment.update params
              present comment, with: API::Entities::comment
            end

            # # Figure out how all works and fix
            # desc "Replace a comment"
            # params do
            #   requires :all
            # end
            # put ":id", root: "comment" do
            #   comment = Comment.find_by id: params[:id]
            #   comment.update params
            #   present comment, with: API::Entities::Comment
            # end

            desc "Delete a comment"
            params do
              requires :id, type: String, desc: "ID of the 
                comment"
            end
            delete ":id", root: "comment" do
              comment = Comment.find_by id: params[:id]
              comment.destroy
            end
          end
        end
      end
    end
  end
end  