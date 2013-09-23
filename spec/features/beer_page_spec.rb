require 'spec_helper'

describe "Beer page" do

	it "creates new beer" do
		brewery = FactoryGirl.create(:thornbridge)
		
		visit new_beer_path
		
	    fill_in 'beer[name]', :with => 'Halcyon'
	    select "IPA", :from => 'beer[style]'
		select brewery.to_s, :from => 'beer[brewery_id]'
		
		expect {
			click_button "Create Beer"
		}.to change{ Beer.count }.by 1
		
	end
  
	describe "when beer exists" do
		before :each do 
			@jaipur = FactoryGirl.create(:jaipur)
			visit beer_path @jaipur
		end
  
		it "shows the details" do

			expect(page).to have_content "Name: #{@jaipur.name}"
			expect(page).to have_content "Style: #{@jaipur.style}"
			expect(page).to have_content "Brewery: #{@jaipur.brewery}"
		end
		
		it "tells that no ratings exists" do
			
			expect(page).to have_content "beer has not yet been rated!"
		end
		
		describe "and has ratings" do
			before :each do
				@user = FactoryGirl.create :user
				@rating1 = FactoryGirl.create :rating1, :beer => @jaipur, :user => @user
				@rating2 = FactoryGirl.create :rating2, :beer => @jaipur, :user => @user
				visit current_path # reload page
			end
			
			it "displays average" do
			
				expect(page).to have_content "average 15"
			end
			
			it "displays rating count" do
			
				expect(page).to have_content "beer has 2 ratings"
			end
		end
	end
end

