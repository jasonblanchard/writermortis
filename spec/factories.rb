FactoryGirl.define do
    factory :user do
        name "Charlie"
        email "charlie@example.com"
        password "examplepassword"
    end

    factory :story do
        title 'My Great Story'
    end

    factory :slice do
        body 'Once upon a time, there was a duck named Quackers.'

    end
end

