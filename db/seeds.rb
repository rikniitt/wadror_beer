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

b1.beers.create :name => "Iso 3", :style => "Lager"
b1.beers.create :name => "Karhu", :style => "Lager"
b1.beers.create :name => "Tuplahumala", :style => "Lager"
b2.beers.create :name => "Huvila Pale Ale", :style => "Pale Ale"
b2.beers.create :name => "X Porter", :style => "Porter"
b3.beers.create :name => "Hefezeizen", :style => "Weizen"
b3.beers.create :name => "Helles", :style => "Lager"



b4 = Brewery.create :name => "Brewdog", :year => 2007

punk = b4.beers.create :name => "Punk IPA", :style => "IPA"
nanny = b4.beers.create :name => "Nanny State", :style => "lowalcohol"

u = User.first

punk.ratings.create :score => 25, :user_id => u.id
punk.ratings.create :score => 32, :user_id => u.id
nanny.ratings.create :score => 18, :user_id => u.id
nanny.ratings.create :score => 22, :user_id => u.id

BeerClub.create :name => "Humanistien viinin makuisten oluiden seura", :founded => 2014, :city => "Helsinki"
c = BeerClub.create :name => "Kumpulan hiiva", :founded => 2010, :city => "Helsinki"

Membership.create :user_id => u.id, :beer_club_id => c.id


