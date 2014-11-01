FactoryGirl.define do

  factory :user, class: 'User' do
    email 'mail@domain.com'
    password_digest 'password'
    fname 'Live'
    lname 'User'    
  end

  factory :userOne, class: 'User' do
    email 'fake@domain.com'
    password_digest 'password'
    fname 'User'
    lname 'One'    
  end
  

  factory :barber1, class: 'User' do
    email 'barber@domain.com'
    password_digest 'password'
    fname 'Barber'
    lname 'One'    
    barber true
  end
  
  
  factory :barber2, class: 'User' do
    email 'barber2@domain.com'
    password_digest 'password'
    fname 'Barber'
    lname 'Two'    
    barber true
  end
end
