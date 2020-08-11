# Add seed data here. Seed your database with `rake db:seed`

billy_joel = Artist.create(name: 'Billy Joel')
doo_wop = Genre.create(name: 'Doo Wop')
longest_time = Song.create(name: 'The Longest Time', artist: billy_joel)