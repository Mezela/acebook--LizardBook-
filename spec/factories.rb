FactoryBot.define do
  factory :message do
    content { "MyText" }
    conversation { nil }
    user { nil }
    read { false }
  end

  factory :conversation do
    sender_id { 1 }
    receiver_id { 1 }
  end


  factory :user do
    id { "1" }
    username {"Example-Lizard"}
    email { "example@lizard.com" }
    password { "password" }
    full_name { "Example Lizard" }
    lizard_species { "toad" }
    birthday { "01/01/2019" }
    profile_picture { "http://www.google.com" }
  end

  factory :post do
    user
    content { "Hello, Earth!" }
  end
end
