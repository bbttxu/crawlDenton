mongoose = require 'mongoose'
require('mongo-relation')
require('mongoose-moment')(mongoose)
findOrCreate = require 'mongoose-findorcreate'
# slug = require 'mongoose-friendly-id'
schema = mongoose.Schema startsAt: 'Moment'
# schema.plugin slug, 'name'
schema.plugin findOrCreate
schema.belongsTo 'Venue', through: 'venue'

module.exports = mongoose.model 'Show', schema


