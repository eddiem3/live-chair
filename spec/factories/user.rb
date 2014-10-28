FactoryGirl.define do
  factory :user do
    email 'mail@domain.com'
    password_digest 'password'
    fname 'Live'
    lname 'User'    
  end
end
