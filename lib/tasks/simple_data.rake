namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@eleison.tk",
                 password: "foobar2000",
                 password_confirmation: "foobar2000")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@eleison.tk"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end