module API
  module V1
    class Posts < Grape::API
      include API::V1::Defaults
      resource :posts do
        desc "Return all posts"
        get "", root: :posts do
          posts = Post.all
          present posts, with: API::Entities::Post
        end

        desc "Return a post"
        params do
          requires :id, type: String, desc: "ID of the 
            post"
        end
        get ":id", root: "post" do
          post = Post.where(id: permitted_params[:id]).first!
          present post, with: API::Entities::Post
        end

        desc "Create a post"
        params do
          requires :all, except: [:id], using: API::Entities::Post.documentation.except(:id)
        end
        post "", root: :posts do
          post = Post.create! params
          present post, with: API::Entities::Post
        end

        desc "Modify a post"
        params do
          requires :id, type: String, desc: "ID of the 
            user"
        end
        patch ":id", root: "post" do
          post = Post.find_by id: params[:id]
          post.update params
          present post, with: API::Entities::post
        end

        # # Figure out how all works and fix
        # desc "Replace a post"
        # params do
        #   requires :all
        # end
        # put ":id", root: "post" do
        #   post = Post.find_by id: params[:id]
        #   post.update params
        #   present post, with: API::Entities::Post
        # end

        desc "Delete a post"
        params do
          requires :id, type: String, desc: "ID of the 
            post"
        end
        delete ":id", root: "post" do
          post = Post.find_by id: params[:id]
          post.destroy
        end
      end
    end
  end
end  