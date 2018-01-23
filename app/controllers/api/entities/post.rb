module API
 module Entities
  class Post < Grape::Entity
    expose :id, :text, :image, :user_id
  end
 end
end
