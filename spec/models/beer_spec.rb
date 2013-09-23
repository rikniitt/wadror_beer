require 'spec_helper'

describe Beer do
	it "is not saved without name" do
		beer = Beer.create :style => "IPA"

		expect(beer.valid?).to be(false)
		expect(Beer.count).to eq(0)
	end
	
	it "is not saved without style" do
		beer = Beer.create :name => "Jaipur"

		expect(beer.valid?).to be(false)
		expect(Beer.count).to eq(0)
	end
	
	describe "with a proper name and style" do
		let(:beer) { FactoryGirl.create :beer }
		
		it "is saved" do
			expect(beer.valid?).to eq(true)
			expect(Beer.count).to eq(1)
		end
	end
end
