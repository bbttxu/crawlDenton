mongoose = require 'mongoose'
require('mongo-relation')
findOrCreate = require 'mongoose-findorcreate'
slug = require 'mongoose-friendly-id'
schema = mongoose.Schema name: String
schema.plugin slug, 'name'
schema.plugin findOrCreate
schema.hasMany 'Show', dependent: 'delete', through: 'shows'

module.exports = mongoose.model 'Venue', schema


