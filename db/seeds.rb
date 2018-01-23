# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {
      full_name: 'Hamada Helal',
      profile_picture: '../../public/generic-user.png',
      job_title: 'Lead Singer at Tarab Ltd'
    },
    {
      full_name: 'Azza Fahmy',
      profile_picture: '../../public/generic-user.png',
      job_title: 'Owner at Azza Fahmy'
    },
    {
      full_name: 'Bahia ElSharkawy',
      profile_picture: '../../public/generic-user.png',
      job_title: 'CEO at AlMakinah'
    }
  ])

user_posts = UserPost.create([
    {
      text: 'Excepteur ut aliqua pariatur aute nostrud adipisicing anim enim officia reprehenderit eiusmod enim nostrud elit officia voluptate nulla incididunt.',
      image: '../../public/star.jpg',
      user_id: 1
    },
    {
      text: 'Occaecat irure cupidatat consectetur ea dolor sunt dolore commodo ut nulla laborum aute aliquip veniam et sed duis ut sed magna aute magna irure exercitation sint.',
      image: '../../public/star.jpg',
      user_id: 2
    }
  ])

polls = Poll.create([
    {
      text: 'Ea proident sed esse ullamco ut cillum exercitation in anim sed velit ullamco excepteur quis anim dolore in est ut id id exercitation fugiat.',
      image: '../../public/star.jpg',
      user_id: 3
    }
  ])