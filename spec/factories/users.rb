FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    profile               {Faker::Internet.username}
    occupation            {Faker::Job.title}
    position              {Faker::Job.position}
  end
end