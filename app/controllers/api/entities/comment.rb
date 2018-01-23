module API
 module Entities
  class Comment < Grape::Entity
    expose :id, :text, :image
  end
 end
end