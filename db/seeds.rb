# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b1 = Brewery.create :name => "Koff", :year => 1897
b2 = Brewery.create :name => "Malmgard", :year => 2001
b3 = Brewery.create :name => "Weihenstephaner", :year => 1042
b4 = Brewery.create :name => "Brewdog", :year => 2007

euro_lager = Style.create :name => "Euro Pale Lager", :description => "Similar to the Munich Helles story, many European countries reacted to the popularity of early pale lagers by brewing their own. Hop flavor is significant and of noble varieties, bitterness is moderate, and both are backed by a solid malt body and sweetish notes from an all-malt base."
euro_strong_lager = Style.create :name => "Euro Strong Lager", :description => "Many breweries around the world brew a stronger version of their regular lager. For the US there is the Ice Beer & Malt Liquor, both have a high amount of rice or corn to lighten the flavor. Many European & Asian breweries have a strong lager similar to the Malt Liquor though there is more malt use or it is all malt. Many breweries rush the fermentation or the brew will be too light and signs of higher alcohols will be noticed in the aroma and flavor."
pale_ale = Style.create :name => "English Pale Ale", :description => "The English Pale Ale can be traced back to the city of Burton-upon-Trent, a city with an abundance of rich hard water. This hard water helps with the clarity as well as enhancing the hop bitterness. This ale can be from golden to reddish amber in color with generally a good head retention. A mix of fruity, hoppy, earthy, buttery and malty aromas and flavors can be found. Typically all ingredients are English."
baltic_porter = Style.create :name => "Baltic Porter", :description => "Porters of the late 1700's were quite strong compared to today's standards, easily surpassing 7\% alcohol by volume. Some brewers made a stronger, more robust version, to be shipped across the North Sea, dubbed a Baltic Porter. In general, the style's dark brown color covered up cloudiness and the smoky/roasted brown malts and bitter tastes masked brewing imperfections. The addition of stale ale also lent a pleasant acidic flavor to the style, which made it quite popular. These issues were quite important given that most breweries were getting away from pub brewing and opening up breweries that could ship beer across the world."
weizen = Style.create :name => "Heweizen", :description => "A south German style of wheat beer (weissbier) made with a typical ratio of 50:50, or even higher, wheat. A yeast that produces a unique phenolic flavors of banana and cloves with an often dry and tart edge, some spiciness, bubblegum or notes of apples. Little hop bitterness, and a moderate level of alcohol. The \"Hefe\" prefix means \"with yeast\", hence the beers unfiltered and cloudy appearance. Poured into a traditional Weizen glass, the Hefeweizen can be one sexy looking beer. Often served with a lemon wedge (popularized by Americans), to either cut the wheat or yeast edge, which many either find to be a flavorful snap ... or an insult and something that damages the beer's taste and head retention."
helles_lager = Style.create :name => "Munich Helles Lager", :description => "When the golden and clean lagers of Plzen (Bohemia) became all the rage in the mid-1800's, München brewers feared that Germans would start drinking the Czech beer vs. their own. Munich Helles Lager was their answer to meet the demand. A bit more malty, they often share the same spicy hop characters of Czech Pils, but are a bit more subdued and in balance with malts. \"Helles\" is German for \"bright.\""
a_ipa = Style.create :name => "American IPA", :description => "The American IPA is a different soul from the reincarnated IPA style. More flavorful than the withering English IPA, color can range from very pale golden to reddish amber. Hops are typically American with a big herbal and / or citric character, bitterness is high as well. Moderate to medium bodied with a balancing malt backbone."
low = Style.create :name => "Low Alcohol Beer", :description => "Low Alcohol Beer is also commonly known as Non Alcohol (NA) beer, which is a fallacy as all of these beers still contain small amounts of alcohol. Low Alcohol Beers are generally subjected to one of two things: a controlled brewing process that results in a low alcohol content, or the alcohol is removed using a reverse-osmosis method which passes alcohol through a permeable membrane. Very light on aroma, body, and flavor."

b1.beers.create :name => "Iso 3", :style_id => euro_lager.id
b1.beers.create :name => "Karhu", :style_id => euro_lager.id
b1.beers.create :name => "Tuplahumala", :style_id => euro_strong_lager.id
b2.beers.create :name => "Huvila Pale Ale", :style_id => pale_ale.id
b2.beers.create :name => "X Porter", :style_id => baltic_porter.id
b3.beers.create :name => "Hefeweissbier", :style_id => weizen.id
b3.beers.create :name => "Original", :style_id => helles_lager.id
punk = b4.beers.create :name => "Punk IPA", :style_id => a_ipa.id
nanny = b4.beers.create :name => "Nanny State", :style_id => low.id

BeerClub.create :name => "Humanistien viinin makuisten oluiden seura", :founded => 2014, :city => "Helsinki"
c = BeerClub.create :name => "Kumpulan hiiva", :founded => 2010, :city => "Helsinki"


u = User.first

punk.ratings.create :score => 25, :user_id => u.id
punk.ratings.create :score => 32, :user_id => u.id
nanny.ratings.create :score => 18, :user_id => u.id
nanny.ratings.create :score => 22, :user_id => u.id

Membership.create :user_id => u.id, :beer_club_id => c.id


