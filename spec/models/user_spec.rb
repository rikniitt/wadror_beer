require 'spec_helper'



describe User do
	it "has the username set correctly" do
		user = User.new :username => "Pekka"

		user.username.should == "Pekka"
	end

	it "is not saved without a proper password" do
		user = User.create :username => "Pekka69"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end
	
	it "is not saved with too short username" do
		user = User.create :username => "P1", :password => "mysecret1", :password_confirmation=> "mysecret1"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end
	
	it "is not saved with username containing only character" do
		user = User.create :username => "Pekka", :password => "mysecret1", :password_confirmation=> "mysecret1"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end
	
	it "is not saved with too short password" do
		user = User.create :username => "Pekka69", :password => "mys", :password_confirmation=> "mys"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end
  
	describe "with a proper password" do
		let(:user) { FactoryGirl.create :user }
		
		it "is saved" do
			expect(user.valid?).to eq(true)
			expect(User.count).to eq(1)
		end
	  
		it "and with two ratings, has the correct average rating" do
			rating1 = FactoryGirl.create :rating1
			rating2 = FactoryGirl.create :rating2

			user.ratings << rating1
			user.ratings << rating2

			expect(user.ratings.count).to eq(2)
			expect(user.average_rating).to eq(15.0)
		end
	end
	
	describe "favorite beer" do
		let(:user) { FactoryGirl.create :user }
		
		it "has method for determining one" do
			user.should respond_to :favorite_beer
		end
		
		it "without ratings does not have one" do
			expect(user.favorite_beer).to eq(nil)
		end
		
		it "is the only rated if only one rating" do
			beer = create_beer_with_rating 10, user
    
			expect(user.favorite_beer).to eq(beer)
		end
		
		it "is the one with highest rating if several rated" do
			create_beers_with_ratings 10, 20, 15, 7, 9, user
			best = create_beer_with_rating 25, user
			
			expect(user.favorite_beer).to eq(best)
		end
	end
	
	describe "favorite style" do
		let(:user) { FactoryGirl.create :user }
		
		it "has method for determining one" do
			user.should respond_to :favorite_style
		end
		
		it "without ratings does not have one" do
			expect(user.favorite_style).to eq(nil)
		end
		
		it "is style of the only rated beer if only one rating" do
			beer = create_beer_with_rating 10, user
    
			expect(user.favorite_style).to eq(beer.style)
		end
			
		it "is the one with highest rating if several rated" do
			create_beers_with_ratings 10, 20, 15, 7, 9, user
			best = FactoryGirl.create(:beer2)
			FactoryGirl.create(:rating, :score => 25,  :beer => best, :user => user)
				
			expect(user.favorite_style).to eq(best.style)
		end
	end
	
	def create_beers_with_ratings(*scores, user)
		scores.each do |score|
			create_beer_with_rating score, user
		end
	end

	def create_beer_with_rating(score, user)
		beer = FactoryGirl.create(:beer)
		FactoryGirl.create(:rating, :score => score,  :beer => beer, :user => user)
		beer
	end

end
