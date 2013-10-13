# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b1 = Brewery.create :name => "Koff", :year => 1897, :active => true
b2 = Brewery.create :name => "Malmgard", :year => 2001, :active => true
b3 = Brewery.create :name => "Weihenstephaner", :year => 1042, :active => true
b4 = Brewery.create :name => "Brewdog", :year => 2007, :active => true
b5 = Brewery.create :name => "Thornbridge", :year => 2005, :active => true
b6 = Brewery.create :name => "Nogne", :year => 2002, :active => true
b7 = Brewery.create :name => "Amalienborg", :year => 1853, :active => false

euro_lager = Style.create :name => "Euro Pale Lager", :description => "Similar to the Munich Helles story, many European countries reacted to the popularity of early pale lagers by brewing their own. Hop flavor is significant and of noble varieties, bitterness is moderate, and both are backed by a solid malt body and sweetish notes from an all-malt base."
euro_strong_lager = Style.create :name => "Euro Strong Lager", :description => "Many breweries around the world brew a stronger version of their regular lager. For the US there is the Ice Beer & Malt Liquor, both have a high amount of rice or corn to lighten the flavor. Many European & Asian breweries have a strong lager similar to the Malt Liquor though there is more malt use or it is all malt. Many breweries rush the fermentation or the brew will be too light and signs of higher alcohols will be noticed in the aroma and flavor."
pale_ale = Style.create :name => "English Pale Ale", :description => "The English Pale Ale can be traced back to the city of Burton-upon-Trent, a city with an abundance of rich hard water. This hard water helps with the clarity as well as enhancing the hop bitterness. This ale can be from golden to reddish amber in color with generally a good head retention. A mix of fruity, hoppy, earthy, buttery and malty aromas and flavors can be found. Typically all ingredients are English."
baltic_porter = Style.create :name => "Baltic Porter", :description => "Porters of the late 1700's were quite strong compared to today's standards, easily surpassing 7\% alcohol by volume. Some brewers made a stronger, more robust version, to be shipped across the North Sea, dubbed a Baltic Porter. In general, the style's dark brown color covered up cloudiness and the smoky/roasted brown malts and bitter tastes masked brewing imperfections. The addition of stale ale also lent a pleasant acidic flavor to the style, which made it quite popular. These issues were quite important given that most breweries were getting away from pub brewing and opening up breweries that could ship beer across the world."
weizen = Style.create :name => "Heweizen", :description => "A south German style of wheat beer (weissbier) made with a typical ratio of 50:50, or even higher, wheat. A yeast that produces a unique phenolic flavors of banana and cloves with an often dry and tart edge, some spiciness, bubblegum or notes of apples. Little hop bitterness, and a moderate level of alcohol. The \"Hefe\" prefix means \"with yeast\", hence the beers unfiltered and cloudy appearance. Poured into a traditional Weizen glass, the Hefeweizen can be one sexy looking beer. Often served with a lemon wedge (popularized by Americans), to either cut the wheat or yeast edge, which many either find to be a flavorful snap ... or an insult and something that damages the beer's taste and head retention."
helles_lager = Style.create :name => "Munich Helles Lager", :description => "When the golden and clean lagers of Plzen (Bohemia) became all the rage in the mid-1800's, München brewers feared that Germans would start drinking the Czech beer vs. their own. Munich Helles Lager was their answer to meet the demand. A bit more malty, they often share the same spicy hop characters of Czech Pils, but are a bit more subdued and in balance with malts. \"Helles\" is German for \"bright.\""
a_ipa = Style.create :name => "American IPA", :description => "The American IPA is a different soul from the reincarnated IPA style. More flavorful than the withering English IPA, color can range from very pale golden to reddish amber. Hops are typically American with a big herbal and / or citric character, bitterness is high as well. Moderate to medium bodied with a balancing malt backbone."
low = Style.create :name => "Low Alcohol Beer", :description => "Low Alcohol Beer is also commonly known as Non Alcohol (NA) beer, which is a fallacy as all of these beers still contain small amounts of alcohol. Low Alcohol Beers are generally subjected to one of two things: a controlled brewing process that results in a low alcohol content, or the alcohol is removed using a reverse-osmosis method which passes alcohol through a permeable membrane. Very light on aroma, body, and flavor."
e_ipa = Style.create :name => "English India Pale Ale", :description => "First brewed in England and exported for the British troops in India during the late 1700s. To withstand the voyage, IPA's were basically tweaked Pale Ales that were, in comparison, much more malty, boasted a higher alcohol content and were well-hopped, as hops are a natural preservative. Historians believe that an IPA was then watered down for the troops, while officers and the elite would savor the beer at full strength. The English IPA has a lower alcohol due to taxation over the decades. The leaner the brew the less amount of malt there is and less need for a strong hop presence which would easily put the brew out of balance. Some brewers have tried to recreate the origianl IPA with strengths close to 8-9\% abv."
vienna_lager = Style.create :name => "Vienna Lager", :description => "Named after the city in which it orginated, a traditional Vienna lager is brewed using a three step decoction boiling process. Munich, Pilsner, Vienna toasted and dextrin malts are used, as well wheat in some cases. Subtle hops, crisp, with residual sweetness. Although German in origin and rare these days, some classic examples come from Mexico, such as: Dos Equis and Negra Modelo. A result of late 19th century immigrant brewers from Austria."
apa = Style.create :name => "American Pale Ale", :description => "Of British origin, this style is now popular worldwide and the use of local ingredients, or imported, produces variances in character from region to region. Generally, expect a good balance of malt and hops. Fruity esters and diacetyl can vary from none to moderate, and bitterness can range from lightly floral to pungent. American versions tend to be cleaner and hoppier, while British tend to be more malty, buttery, aromatic and balanced."


iso = b1.beers.create :name => "Iso 3", :style_id => euro_lager.id
karhu = b1.beers.create :name => "Karhu", :style_id => euro_lager.id
th = b1.beers.create :name => "Tuplahumala", :style_id => euro_strong_lager.id
huvila = b2.beers.create :name => "Huvila Pale Ale", :style_id => pale_ale.id
xporter = b2.beers.create :name => "X Porter", :style_id => baltic_porter.id
hefe = b3.beers.create :name => "Hefeweissbier", :style_id => weizen.id
og = b3.beers.create :name => "Original", :style_id => helles_lager.id
punk = b4.beers.create :name => "Punk IPA", :style_id => a_ipa.id
nanny = b4.beers.create :name => "Nanny State", :style_id => low.id
jaipur = b5.beers.create :name => "Jaipur", :style_id => e_ipa.id
kill = b5.beers.create :name => "Kill Your Darlings", :style_id => vienna_lager.id
gpa = b6.beers.create :name => "GPA", :style_id => apa.id

BeerClub.create :name => "Humanistien viinin makuisten oluiden seura", :founded => 2014, :city => "Helsinki"
c = BeerClub.create :name => "Kumpulan hiiva", :founded => 2010, :city => "Helsinki"

user = User.first

iso.ratings.create :score => 15, :user_id => user.id
karhu.ratings.create :score => 18, :user_id => user.id
th.ratings.create :score => 19, :user_id => user.id
huvila.ratings.create :score => 23, :user_id => user.id
xporter.ratings.create :score => 27, :user_id => user.id
hefe.ratings.create :score => 38, :user_id => user.id
og.ratings.create :score => 33, :user_id => user.id
punk.ratings.create :score => 45, :user_id => user.id
punk.ratings.create :score => 32, :user_id => user.id
nanny.ratings.create :score => 7, :user_id => user.id
nanny.ratings.create :score => 11, :user_id => user.id
jaipur.ratings.create :score => 46, :user_id => user.id
kill.ratings.create :score => 44, :user_id => user.id
gpa.ratings.create :score => 39, :user_id => user.id

Membership.create :user_id => user.id, :beer_club_id => c.id, :confirmed => true

=begin
users = 100
breweries = 50
beers_in_brewery = 50
ratings_per_user = 30

(1..users).each do |i|
  User.create :username => "user_#{i}", :password => "passwd1", :password_confirmation => "passwd1"
end

(1..breweries).each do |i|
  Brewery.create :name => "brewery_#{i}", :year => 1900, :active => true
end

bulk = Style.create :name => "bulk", :description => "cheap, not much taste"

Brewery.all.each do |b|
  n = rand(beers_in_brewery)
  (1..n).each do |i|
    beer = Beer.create :name => "beer #{b.id} -- #{i}"
    beer.style = bulk
    b.beers << beer
  end
end

User.all.each do |u|
  n = rand(ratings_per_user)
  beers = Beer.all.shuffle
  (1..n).each do |i|
    r = Rating.new :score => (1+rand(50))
    beers[i].ratings << r
    u.ratings << r
  end
end
=end
