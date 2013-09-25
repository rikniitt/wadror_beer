require 'spec_helper'

describe "User" do
  include OwnTestHelper
  
  it "when signed up with good credentials, is added to the system" do
	  visit signup_path
	  fill_in('user_username', :with => 'Brian007')
	  fill_in('user_password', :with => 'secret55')
	  fill_in('user_password_confirmation', :with => 'secret55')
	  
	  expect{
		click_button('Create User')
	  }.to change{User.count}.by(1)
  end

  describe "who has signed up" do
    before :each do
      @user = FactoryGirl.create :user
    end
    
    it "can sign in with right credentials" do
      sign_in 'Pekka69', 'mysecret1'

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka69'
    end
    
	it "is redirected back to sign in form if wrong credentials given" do
		sign_in 'Pekka69', 'wrong'

		expect(current_path).to eq(signin_path)
		expect(page).to have_content 'Username and password does not match!'
	end
	
	describe "and has ratings" do
		before :each do
			sign_in 'Pekka69', 'mysecret1'
			@beer = FactoryGirl.create :jaipur
			@rating1 = FactoryGirl.create :rating1, :beer => @beer, :user => @user
			@rating2 = FactoryGirl.create :rating2, :beer => @beer, :user => @user
		end
		
		it "lists the existing ratings" do
			visit user_path @user.id
			
			expect(page).to have_content 'has given 2 ratings'
			expect(page).to have_content "#{@beer.name} #{@rating1.score}"
			expect(page).to have_content "#{@beer.name} #{@rating2.score}"
		end 
		
		it "displays users favorite beer" do
			visit user_path @user.id
			
			expect(page).to have_content "Favorite beer: #{@beer}"
		end
		
		it "displays users favorite style" do
			visit user_path @user.id
			
			expect(page).to have_content "Favorite style: #{@beer.style}"
		end
		
		it "shows users favorite brewery" do
			visit user_path @user.id
			
			expect(page).to have_content "Favorite brewery: #{@beer.brewery}"
		end
		
		it "removes rating when user deletes it" do
			sign_in 'Pekka69', 'mysecret1'
			click_link "Pekka69"
			
			expect{
				click_link "delete", :match => :first
			}.to change{ Rating.count }.by(-1)
		end
	end
  end
end

