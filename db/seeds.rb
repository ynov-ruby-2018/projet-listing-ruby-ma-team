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
Category.create({name: 'Food'})


announcement = Announcement.create(
    {
        title: "Titre de l'annonce 1",
        description: "lorem ipsum dolor sit amet",
        category_id: category.id,
        picture:"http://placehold.it/500x500",
        price: 200.0
    })

Message.create([
    {
        content: 'salut',
        announcement_id: announcement.id
    }])
