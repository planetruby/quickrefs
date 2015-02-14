
nirvana     = Artist.create!( name: 'Nirvana' )
soundgarden = Artist.create!( name: 'Soundgarden' )

bleach   = Album.create!( artist: nirvana, title: 'Bleach',    year: 1989 )
nevermind= Album.create!( artist: nirvana, title: 'Nevermind', year: 1991 )
## or bleach.create_album!( )

Song.create!( album: bleach, title: 'Blew',             length: 2.55 )
Song.create!( album: bleach, title: 'Floyd the Barber', length: 2.18 )
Song.create!( album: bleach, title: 'About a Girl',     length: 2.48 )
## or bleach.create_song!()


