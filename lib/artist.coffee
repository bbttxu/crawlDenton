mongoose = require 'mongoose'
findOrCreate = require 'mongoose-findorcreate'
slug = require 'mongoose-friendly-id'
schema = mongoose.Schema name: String
schema.plugin slug, 'name'
schema.plugin findOrCreate

module.exports = mongoose.model 'Artist', schema


