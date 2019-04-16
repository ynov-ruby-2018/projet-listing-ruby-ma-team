# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

category = Category.create({name: 'Technology'})
category_2 = Category.create({name: 'Food'})

adrien = User.create!(
               {
                   firstname: 'Adrien',
                   lastname: 'CABAUD',
                   email: 'adrien.cabaud@ynov.com',
                   password: 'p@ssw0rd',
                   password_confirmation: 'p@ssw0rd'
               }
)

jules = User.create!(
    {
        firstname: 'Jules',
        lastname: 'LAURENT',
        email: 'jules.laurent@outlook.com',
        password: 'p@ssw0rd',
        password_confirmation: 'p@ssw0rd'
    }
)

announcement = Announcement.create(
    {
        title: "Titre de l'annonce 1",
        description: "lorem ipsum dolor sit amet",
        category_id: category.id,
        picture:"http://placehold.it/500x500",
        price: 200.0,
        user_id: jules.id
    })

Announcement.create(
    {
        title: "Titre de l'annonce 2",
        description: "lalalalalallat",
        category_id: category_2.id,
        picture:"http://placehold.it/500x500",
        price: 200.0,
        user_id: adrien.id
    })


Message.create(
    {
        content: 'salut',
        announcement_id: announcement.id,
        user_id: adrien.id
    })