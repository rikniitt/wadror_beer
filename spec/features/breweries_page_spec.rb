require 'spec_helper'

describe "Breweries page" do
	
	it "should not have any before been created" do
		visit breweries_path
		expect(page).to have_css 'h1', text: 'Breweries'
		expect(page).to have_content 'Number of active breweries: 0'
	end
  
	describe "when breweries exists" do
		before :each do 
			@breweries = ["Koff", "Karjala", "Schlenkerla"]
			@breweries.each do |brewery|
				FactoryGirl.create(:brewery, :name => brewery, :year => 1897, :active => true)
			end
			
			visit breweries_path
		end
  
		it "lists the existing breweries and their total number" do

			expect(page).to have_content "Number of active breweries: #{@breweries.count}"

			@breweries.each do |brewery|
				expect(page).to have_content brewery
			end
		end
		
		it "allows user to navigate to page of a Brewery" do

			click_link "Koff"

			expect(page).to have_content "Koff"
			expect(page).to have_content "Established year 1897"
		end
	end
end
