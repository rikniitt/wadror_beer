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
  
  factory :style do
	name "IPA"
  end
  
  factory :lager, :class => Style do
	name "Lager"
  end
  
  factory :pale, :class => Style do
	name "Pale Ale"
  end
  
  factory :brewery do
	name "anonymous"
	year 1900
	active true
  end

  factory :beer do
	name "anonymous"
	brewery
	style { FactoryGirl.create(:lager) }
  end
  
  factory :rating do
	score 10
  end

  
  factory :thornbridge, :class => Brewery do
	name "Thornbridge"
	year 2005
	active true
  end
    
  factory :jaipur, :class => Beer do
	name "Jaipur"
	brewery { FactoryGirl.create(:thornbridge) }
    style
  end
  
    
  factory :kill_darlings, :class => Beer do
	name "Kill Your Darlings"
	brewery { FactoryGirl.create(:thornbridge) }
    style { FactoryGirl.create(:lager) }
  end
  
  
  factory :nogne, :class => Brewery do
	name "Nogne"
	year 2002
	active true
  end
  
  factory :gpa, :class => Beer do
	name "GPA"
	brewery { FactoryGirl.create(:nogne) }
	style { FactoryGirl.create(:pale) }
  end
  
end
