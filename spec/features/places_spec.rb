# encoding: UTF-8
require 'spec_helper'

describe "Places" do
	it "if one is returned by the API, it is shown at the page" do
		BeermappingAPI.stub(:places_in).with("kumpula").and_return( [  Place.new(:name => "Oljenkorsi") ] )

		visit places_path
		fill_in('city', :with => 'kumpula')
		click_button "Search"

		expect(page).to have_content "Oljenkorsi"
	end
	
	it "if many is returned by the API, they are shown at the page" do
		BeermappingAPI.stub(:places_in).with("keskusta").and_return( [ 	Place.new(:name => "Kaisla"), 
																		Place.new(:name => "Amsterdam"), 
																		Place.new(:name => "Bryggeri"),
																		Place.new(:name => "Villi Wäinö"),
																		Place.new(:name => "Teerenpeli") ] )

		visit places_path
		fill_in('city', :with => 'keskusta')
		click_button "Search"

		expect(page).to have_content "Kaisla"
		expect(page).to have_content "Amsterdam"
		expect(page).to have_content "Bryggeri"
		expect(page).to have_content "Villi Wäinö"
		expect(page).to have_content "Teerenpeli"
	end
	
	it "if none is found, it is shown at the page" do
		BeermappingAPI.stub(:places_in).with("mäntsälä").and_return( [] )
		
		visit places_path
		fill_in('city', :with => 'mäntsälä')
		click_button "Search"

		expect(page).to have_content "No locations in mäntsälä"
	end
end
