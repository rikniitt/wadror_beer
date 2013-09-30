# encoding: UTF-8
require 'spec_helper'

describe "BeermappingAPI" do
	it "When HTTP GET returns one entry, it is parsed and returned" do
		s = <<-END_OF_STRING
			<?xml version='1.0' encoding='utf-8' ?><bmp_locations><location><id>13307</id><name>O'Connell's Irish Bar</name><status>Beer Bar</status><reviewlink>http://beermapping.com/maps/reviews/reviews.php?locid=13307</reviewlink><proxylink>http://beermapping.com/maps/proxymaps.php?locid=13307&amp;d=5</proxylink><blogmap>http://beermapping.com/maps/blogproxy.php?locid=13307&amp;d=1&amp;type=norm</blogmap><street>Rautatienkatu 24</street><city>Tampere</city><state></state><zip>33100</zip><country>Finland</country><phone>35832227032</phone><overall>0</overall><imagecount>0</imagecount></location></bmp_locations>
		END_OF_STRING

		stub_request(:get, /.*/).to_return(:body => s, :headers => { 'Content-Type' => "text/xml" })

		places = BeermappingAPI.places_in("tampere")

		expect(places.size).to eq(1)
		place = places.first
		expect(place.name).to eq("O'Connell's Irish Bar")
		expect(place.street).to eq("Rautatienkatu 24")
	end
	
	it "When HTTP GET returns no entries, it is parsed and returned" do
		s = <<-END_OF_STRING
			<?xml version='1.0' encoding='utf-8' ?>
			<bmp_locations>
				<location>
					<id></id>
					<name></name>
					<status></status>
					<reviewlink></reviewlink>
					<proxylink></proxylink>
					<blogmap></blogmap>
					<street></street>
					<city></city>
					<state></state>
					<zip></zip>
					<country></country>
					<phone></phone>
					<overall>
					</overall>
					<imagecount></imagecount>
				</location>
			</bmp_locations>
		END_OF_STRING

		stub_request(:get, /.*/).to_return(:body => s, :headers => { 'Content-Type' => "text/xml" })

		places = BeermappingAPI.places_in("pihtipudas")

		expect(places.size).to eq(0)
    end
	  
	  
	it "When HTTP GET returns many entries, it is parsed and returned" do
		s = <<-END_OF_STRING
<?xml version='1.0' encoding='utf-8' ?>
<bmp_locations>
	<location>
		<id>7428</id>
		<name>Oliver Twist</name>
		<status>Beer Bar</status>
		<reviewlink>
		http://beermapping.com/maps/reviews/reviews.php?locid=7428
		</reviewlink>
		<proxylink>
		http://beermapping.com/maps/proxymaps.php?locid=7428&amp;d=5
		</proxylink>
		<blogmap>
		http://beermapping.com/maps/blogproxy.php?locid=7428&amp;d=1&amp;type=norm
		</blogmap>
		<street>Repslagargatan 6</street>
		<city>Stockholm</city>
		<state/>
		<zip>118 46</zip>
		<country>Sweden</country>
		<phone>46 (0)8 640 05 66</phone>
		<overall>0</overall>
		<imagecount>0</imagecount>
	</location>
	<location>
		<id>7429</id>
		<name>Akkurat</name>
		<status>Beer Bar</status>
		<reviewlink>
		http://beermapping.com/maps/reviews/reviews.php?locid=7429
		</reviewlink>
		<proxylink>
		http://beermapping.com/maps/proxymaps.php?locid=7429&amp;d=5
		</proxylink>
		<blogmap>
		http://beermapping.com/maps/blogproxy.php?locid=7429&amp;d=1&amp;type=norm
		</blogmap>
		<street>Hornsgatan 18</street>
		<city>Stockholm</city>
		<state/>
		<zip/>
		<country>Sweden</country>
		<phone>(08) 6440015</phone>
		<overall>0</overall>
		<imagecount>0</imagecount>
	</location>
	<location>
		<id>7430</id>
		<name>Glenfiddich Warehouse No. 68</name>
		<status>Beer Bar</status>
		<reviewlink>
		http://beermapping.com/maps/reviews/reviews.php?locid=7430
		</reviewlink>
		<proxylink>
		http://beermapping.com/maps/proxymaps.php?locid=7430&amp;d=5
		</proxylink>
		<blogmap>
		http://beermapping.com/maps/blogproxy.php?locid=7430&amp;d=1&amp;type=norm
		</blogmap>
		<street>Västerlånggatan 68</street>
		<city>Stockholm</city>
		<state/>
		<zip>111 29</zip>
		<country>Sweden</country>
		<phone>(08) 791 90 90</phone>
		<overall>0</overall>
		<imagecount>0</imagecount>
	</location>
</bmp_locations>
		END_OF_STRING

		stub_request(:get, /.*/).to_return(:body => s, :headers => { 'Content-Type' => "text/xml" })

		places = BeermappingAPI.places_in("stockholm")

		expect(places.size).to eq(3)
		expect(places.select{ |p|  p.id == "7430" and p.name == "Glenfiddich Warehouse No. 68"}.size).to eq(1) 
		expect(places.select{ |p|  p.id == "7429" and p.name == "Akkurat"}.size).to eq(1)
		expect(places.select{ |p|  p.id == "7428" and p.name == "Oliver Twist"}.size).to eq(1) 
	end
	
	
	it "should not call fetch_places_in when cache exists" do
		Rails.cache.write('kumpula', 'kumpula_places_as_array', :expires_in => 1.hour)
		
	    BeermappingAPI.should_receive(:fetch_places_in).with('kumpula').never
	    
	    assert_equal 'kumpula_places_as_array', BeermappingAPI.places_in('kumpula')
	end
	
	it "should call fetch_places_in when cache doesn't exist" do
		Rails.cache.clear
		
	    BeermappingAPI.should_receive(:fetch_places_in).with('kumpula')
	    
	    BeermappingAPI.places_in('kumpula')
	end
	

	
end
