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
  
  
  factory :brewery do
	name "anonymous"
	year 1900
  end

  factory :beer do
	name "anonymous"
	brewery
	style "Lager"
  end
  
  factory :rating do
	score 10
  end

  
  factory :thornbridge, :class => Brewery do
	name "Thornbridge"
	year 2005
  end
    
  factory :jaipur, :class => Beer do
	name "Jaipur"
	brewery { FactoryGirl.create(:thornbridge) }
    style "IPA"
  end
  
    
  factory :kill_darlings, :class => Beer do
	name "Kill Your Darlings"
	brewery { FactoryGirl.create(:thornbridge) }
    style "Lager"
  end
  
  
  factory :nogne, :class => Brewery do
	name "Nogne"
	year 2002
  end
  
  factory :gpa, :class => Beer do
	name "GPA"
	brewery { FactoryGirl.create(:nogne) }
	style "Pale ale"
  end
  
end
