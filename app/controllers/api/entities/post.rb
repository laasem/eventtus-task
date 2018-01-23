module API
 module Entities
  class Post < Grape::Entity
    expose :id, :text, :image
    expose :user, using: API::Entities::User
    expose :num_reactions
    expose :num_comments
  end
 end
end