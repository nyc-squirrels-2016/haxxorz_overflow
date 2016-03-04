FactoryGirl.define do
    factory :user do
    email {Faker::Internet.email}
    username {Faker::Hipster.word+"#{rand(53)}"}
    about {Faker::Hipster.paragraph}
    password "password"
  end

  factory :question do
    body {Faker::Hipster.paragraph}
    title {Faker::Hipster.sentence}
    association :user, factory: :user
  end

  factory :answer do
    body {Faker::Team.name}
    association :question, factory: :question
    association :user, factory: :user
  end

  factory :comment do

    body {Faker::StarWars.quote}
    association :user, factory: :user

    factory :question_comment do
      association :commentable, factory: :question
    end

    factory :answer_comment do
      association :commentable, factory: :answer
    end

  end
end
