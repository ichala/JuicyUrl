require 'faker'

user = User.create!(email:"user@user.com",password:"123456")
user.urls.create!(original_link:Faker::Internet.url,alias:'test')
user.urls.create!(original_link:Faker::Internet.url,alias:'test2')
10.times do 
    Url.find_by(alias:'test2').visits.create!
end

