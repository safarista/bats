# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create the first database user with permisions to be the boss.

# User.create(
#   full_name: 'Nelson Kelem',
#   username: 'jackBouer',
#   email: 'nelson@safarista.com',
#   password: 'password',
#   password_confirmation: 'password',
#   admin: true,
#   about: 'I am a web and mobile applications developer based in Lincoln UK. I hail from the foothills of Narok in Kenya. Dont say anything bad about morans and Maasai, I shall take you to the bush for it. :] '
# )

# Recreating all the versions of the images to reduce problems of this shit sitiing here
# This is a carrierwave problem
Album.all.each do |album|
  album.photos.each do |photo|
    photo.name.recreate_versions!
  end
end