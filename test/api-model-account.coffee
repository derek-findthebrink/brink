require("dotenv").config()

chai = require("chai")
chai.should()
expect = chai.expect

EventEmitter = require("events")
util = require("util")


nodepath = require("path")
$HOME = process.cwd()


makePath = (m)->
	_path = nodepath.join($HOME, m)
	return _path


{mongoose} = require makePath("config/mongoose")

describe "api", ()->
	before (done)->
		done()

	after (done)->
		# close database connection
		done()

	describe "models", ->
		describe "Account", ->
			it "should do some good stuff"