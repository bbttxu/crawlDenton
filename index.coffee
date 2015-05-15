MONGO_URL = process.env.MONGO_URL or 'mongodb://localhost/crawldenton'

mongoose = require 'mongoose'

mongoose.connect MONGO_URL

cheerio = require 'cheerio'

axios = require 'axios'

ramda = require 'ramda'

_ = require 'underscore'

moment = require 'moment'

Artist = require './lib/artist'
Venue = require './lib/venue'
Show = require './lib/show'

payload =
	url: 'http://www.dentonmainstreet.org/home/events.php'
	method: 'get'


venue = ''
Venue.findOrCreate name: 'Twilight Tunes', (error, venue, data)->
	throw error if error
	# console.log(result, data)
	# venue = result



	axios(payload).then (req)->
		$ = cheerio.load req.data

		peas = $('#inset p strong')
		peas.each (bar,foo)->
			if /(.*)\s(\d{1,2})\ \-\s(.*)/.test $(this).text()
				foo =  $(this).text().match /(.*)\s(\d{1,2})\ \-\s(.*)/
				name = foo[3].trim().split('–')[0].trim()
				artist = Artist.findOrCreate name: name, (error, result, data)->
					throw error if error
					# console.log(result, data)


					time = moment( [ foo[1], foo[2], '18:30' ].join(" "), 'MMMM DD HH mm').utc()


					Show.findOrCreate startsAt: time, (error, show, data)->

						console.log show, venue.shows, show.venue
						show.venue.append venue, (error, result, data)->
							throw error if error
							console.log(result, data)
