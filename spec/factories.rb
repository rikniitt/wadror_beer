FactoryGirl.define do
  factory :user do
    username "Pekka69"
    password "mysecret1"
    password_confirmation "mysecret1"
  end

  factory :rating1, :class => Rating do
    score 10
  end

  factory :rating2, :class => Rating do
    score 20
  end
  
  
  factory :rating do
	score 10
  end

  
  factory :brewery do
	name "Thornbridge"
	year 2005
  end
    
  factory :beer do
	name "Jaipur"
	brewery
    style "IPA"
  end
  
    
  factory :beer2, :class => Beer do
	name "Kill Your Darlings"
	brewery
    style "Lager"
  end

end
