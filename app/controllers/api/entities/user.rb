module API
 module Entities
  class User < Grape::Entity
    expose :id, :full_name, :profile_picture, :job_title
  end
 end
end
